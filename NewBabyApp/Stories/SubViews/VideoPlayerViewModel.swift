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
    @Published var player: AVPlayer
    @Published var currentProgress: Double = 0.0
    @Published var shouldRestart: Bool = false
    @Published var shouldPause: Bool = false

    private var timeObserverToken: Any?
    private var wasPlayingBeforePause: Bool = false

    init(videoName: String) {
        if let filePath = Bundle.main.path(forResource: videoName, ofType: "mp4") {
            self.player = AVPlayer(url: URL(fileURLWithPath: filePath))
        } else {
            self.player = AVPlayer() // Empty player in case the video file is missing
        }
        

        // Setup time observer to track video progress
        addTimeObserver()
    }

    deinit {
        removeTimeObserver()
    }

    func restart() {
        player.seek(to: .zero)
        player.play()
        currentProgress = 0.0
    }

    func pause() {
        wasPlayingBeforePause = player.timeControlStatus == .playing
        player.pause()
    }
    
    func resume() {
        if wasPlayingBeforePause {
            player.play()
        }
    }
    
    func pauseAndSeekToZero() {
        player.pause()
        player.seek(to: .zero)
        currentProgress = 0.0
    }
    
    func updateVideoName(_ newVideoName: String) {
        if let filePath = Bundle.main.path(forResource: newVideoName, ofType: "mp4") {
            player.replaceCurrentItem(with: AVPlayerItem(url: URL(fileURLWithPath: filePath)))
            restart() // Restart the player with the new video
        } else {
            print("Cesta k souboru \(newVideoName) nebyla nalezena.")
        }
    }

    private func addTimeObserver() {
        let interval = CMTime(seconds: 0.1, preferredTimescale: CMTimeScale(NSEC_PER_SEC)) // Update every 0.1 seconds
        timeObserverToken = player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] time in
            guard let self = self,
                  let duration = self.player.currentItem?.duration.seconds,
                  duration > 0 else { return }

            let currentTime = time.seconds
            self.currentProgress = currentTime / duration // Normalized progress between 0 and 1
        }
    }

    private func removeTimeObserver() {
        if let token = timeObserverToken {
            player.removeTimeObserver(token)
            timeObserverToken = nil
        }
    }
}
