//
//  VideoPlayerViewModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 22.10.2024.
//

import AVKit
import Combine
import SwiftUI

class VideoPlayerViewModel: ObservableObject {
    @Published var player: AVPlayer {
        didSet {
            // When player changes, update the published property
            objectWillChange.send()
        }
    }
    @Published var currentProgress: Double = 0.0
    @Published var shouldRestart: Bool = false
    @Published var shouldPause: Bool = false

    private let poolManager = VideoPlayerPoolManager()
    private var wasPlayingBeforePause: Bool = false
    private var cancellables = Set<AnyCancellable>()
    private var currentVideoName: String

    init(videoName: String) {
        self.currentVideoName = videoName
        self.player = AVPlayer() // Temporary, will be replaced by pool manager
        
        setupPoolManagerBindings()
        poolManager.setCurrentVideo(videoName)
    }

    deinit {
        cancellables.removeAll()
    }

    func restart() {
        poolManager.restart()
    }

    func pause() {
        wasPlayingBeforePause = player.timeControlStatus == .playing
        poolManager.pause()
    }
    
    func resume() {
        if wasPlayingBeforePause {
            poolManager.resume()
        }
    }
    
    func pauseAndSeekToZero() {
        poolManager.pauseAndSeekToZero()
    }
    
    func updateVideoName(_ newVideoName: String, storiesGroup: [Story]? = nil) {
        guard newVideoName != currentVideoName else { return }
        
        currentVideoName = newVideoName
        
        // Find adjacent videos for preloading
        let (previousVideo, nextVideo) = findAdjacentVideos(for: newVideoName, in: storiesGroup)
        
        // Use pool manager for smooth transition
        poolManager.setCurrentVideo(newVideoName, previousVideo: previousVideo, nextVideo: nextVideo)
    }
    
    private func setupPoolManagerBindings() {
        // Bind pool manager's player to our published player
        poolManager.$currentPlayer
            .receive(on: DispatchQueue.main)
            .assign(to: \.player, on: self)
            .store(in: &cancellables)
        
        // Bind pool manager's progress to our published progress
        poolManager.$currentProgress
            .receive(on: DispatchQueue.main)
            .assign(to: \.currentProgress, on: self)
            .store(in: &cancellables)
    }
    
    private func findAdjacentVideos(for videoName: String, in storiesGroup: [Story]?) -> (previous: String?, next: String?) {
        guard let stories = storiesGroup else { return (nil, nil) }
        
        // Find current video index
        guard let currentIndex = stories.firstIndex(where: { $0.sourceName == videoName && $0.type == .video }) else {
            return (nil, nil)
        }
        
        // Find previous video
        var previousVideo: String?
        for i in stride(from: currentIndex - 1, through: 0, by: -1) {
            if stories[i].type == .video {
                previousVideo = stories[i].sourceName
                break
            }
        }
        
        // Find next video  
        var nextVideo: String?
        for i in (currentIndex + 1)..<stories.count {
            if stories[i].type == .video {
                nextVideo = stories[i].sourceName
                break
            }
        }
        
        return (previousVideo, nextVideo)
    }
}
