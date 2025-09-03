//
//  VideoPlayerPoolManager.swift
//  NewBabyApp
//
//  Created by Copilot on 02.08.2025.
//

import AVKit
import SwiftUI
import Combine

/// Manages a pool of AVPlayer instances for smooth video transitions
/// Preloads previous, current, and next videos to eliminate loading delays
class VideoPlayerPoolManager: ObservableObject {
    @Published var currentPlayer: AVPlayer = AVPlayer()
    @Published var currentProgress: Double = 0.0
    
    private var playerPool: [String: AVPlayer] = [:]
    private var timeObserverTokens: [AVPlayer: Any] = [:]
    private var currentVideoName: String = ""
    private var preloadedVideos: Set<String> = []
    
    deinit {
        cleanupAllPlayers()
    }
    
    // MARK: - Public Interface
    
    /// Sets the current video and preloads adjacent videos
    func setCurrentVideo(_ videoName: String, previousVideo: String? = nil, nextVideo: String? = nil) {
        // Switch to the video if already preloaded, otherwise load it
        if let player = playerPool[videoName] {
            switchToPlayer(player, for: videoName)
        } else {
            loadAndSwitchToVideo(videoName)
        }
        
        // Preload adjacent videos in background
        preloadVideoIfNeeded(previousVideo)
        preloadVideoIfNeeded(nextVideo)
        
        // Clean up videos that are no longer needed
        cleanupUnusedVideos(keeping: [videoName, previousVideo, nextVideo].compactMap { $0 })
    }
    
    /// Switches to a preloaded video instantly
    func switchToVideo(_ videoName: String) {
        guard let player = playerPool[videoName] else {
            // Video not preloaded, load it immediately
            loadAndSwitchToVideo(videoName)
            return
        }
        
        switchToPlayer(player, for: videoName)
    }
    
    /// Seeks current video to beginning and starts playing
    func restart() {
        currentPlayer.seek(to: .zero)
        currentPlayer.play()
        currentProgress = 0.0
    }
    
    /// Pauses current video
    func pause() {
        currentPlayer.pause()
    }
    
    /// Resumes current video
    func resume() {
        currentPlayer.play()
    }
    
    /// Pauses and seeks to zero
    func pauseAndSeekToZero() {
        currentPlayer.pause()
        currentPlayer.seek(to: .zero)
        currentProgress = 0.0
    }
    
    // MARK: - Private Methods
    
    private func switchToPlayer(_ player: AVPlayer, for videoName: String) {
        // Remove time observer from previous player
        if let token = timeObserverTokens[currentPlayer] {
            currentPlayer.removeTimeObserver(token)
            timeObserverTokens.removeValue(forKey: currentPlayer)
        }
        
        // Pause previous player
        currentPlayer.pause()
        
        // Switch to new player
        currentPlayer = player
        currentVideoName = videoName
        
        // Add time observer to new player
        addTimeObserver(to: currentPlayer)
        
        // Start playing from beginning
        restart()
    }
    
    private func loadAndSwitchToVideo(_ videoName: String) {
        guard let player = createPlayer(for: videoName) else {
            print("Failed to create player for video: \(videoName)")
            return
        }
        
        playerPool[videoName] = player
        preloadedVideos.insert(videoName)
        switchToPlayer(player, for: videoName)
    }
    
    private func preloadVideoIfNeeded(_ videoName: String?) {
        guard let videoName = videoName,
              !preloadedVideos.contains(videoName),
              playerPool[videoName] == nil else { return }
        
        // Preload in background
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self = self,
                  let player = self.createPlayer(for: videoName) else { return }
            
            DispatchQueue.main.async {
                self.playerPool[videoName] = player
                self.preloadedVideos.insert(videoName)
                
                // Preload the video by seeking to start (this loads the video)
                player.seek(to: .zero)
            }
        }
    }
    
    private func createPlayer(for videoName: String) -> AVPlayer? {
        guard let filePath = Bundle.main.path(forResource: videoName, ofType: "mp4") else {
            print("Video file not found: \(videoName).mp4")
            return nil
        }
        
        let url = URL(fileURLWithPath: filePath)
        return AVPlayer(url: url)
    }
    
    private func addTimeObserver(to player: AVPlayer) {
        let interval = CMTime(seconds: 0.1, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        let token = player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] time in
            guard let self = self,
                  player == self.currentPlayer,
                  let duration = player.currentItem?.duration.seconds,
                  duration > 0 else { return }
            
            let currentTime = time.seconds
            self.currentProgress = currentTime / duration
        }
        
        timeObserverTokens[player] = token
    }
    
    private func cleanupUnusedVideos(keeping keepVideos: [String]) {
        let keepSet = Set(keepVideos)
        let toRemove = playerPool.keys.filter { !keepSet.contains($0) }
        
        for videoName in toRemove {
            if let player = playerPool[videoName] {
                // Remove time observer
                if let token = timeObserverTokens[player] {
                    player.removeTimeObserver(token)
                    timeObserverTokens.removeValue(forKey: player)
                }
                
                // Pause and remove player
                player.pause()
                playerPool.removeValue(forKey: videoName)
                preloadedVideos.remove(videoName)
            }
        }
    }
    
    private func cleanupAllPlayers() {
        for (player, token) in timeObserverTokens {
            player.removeTimeObserver(token)
        }
        timeObserverTokens.removeAll()
        
        for player in playerPool.values {
            player.pause()
        }
        playerPool.removeAll()
        preloadedVideos.removeAll()
    }
}