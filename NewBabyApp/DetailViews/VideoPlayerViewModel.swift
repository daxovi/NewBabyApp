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

    private var timeObserverToken: Any?

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
    }

    func pause() {
        player.pause()
        player.seek(to: .zero)
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
