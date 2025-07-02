//
//  PodcastViewModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 02.07.2025.
//

import AVFoundation
import MediaPlayer
import SwiftUI

class PodcastViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate {
    @Published var isPlaying: Bool = false
    @Published var progress: Double = 0
    @Published var isSeeking: Bool = false

    private var player: AVAudioPlayer?
    private var timer: Timer?

    private let fileName: String
    private let title: String

    init(fileName: String, title: String) {
        self.fileName = fileName
        self.title = title
        super.init()
    }

    func setup() {
        configureAudioSession()
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            player = try? AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.prepareToPlay()
        }
        setupRemoteTransportControls()
        updateNowPlaying()
    }

    func togglePlay() {
        guard let player else { return }
        if player.isPlaying {
            pause()
        } else {
            play()
        }
    }

    func play() {
        guard let player else { return }
        player.play()
        isPlaying = true
        startTimer()
        updateNowPlaying(playbackRate: 1)
    }

    func pause() {
        guard let player else { return }
        player.pause()
        isPlaying = false
        stopTimer()
        updateNowPlaying(playbackRate: 0)
    }

    func teardown() {
        pause()
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nil
        try? AVAudioSession.sharedInstance().setActive(false)
    }

    private func configureAudioSession() {
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(.playback, mode: .default)
        try? session.setActive(true)
    }

    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self, let player = self.player else { return }
            if !self.isSeeking {
                self.progress = player.currentTime / player.duration
            }
            self.updateNowPlaying(playbackRate: player.isPlaying ? 1 : 0)
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func setupRemoteTransportControls() {
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget { [weak self] _ in
            self?.play(); return .success
        }
        commandCenter.pauseCommand.addTarget { [weak self] _ in
            self?.pause(); return .success
        }
    }

    private func updateNowPlaying(playbackRate: Float = 0) {
        guard let player else { return }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle: title,
            MPNowPlayingInfoPropertyElapsedPlaybackTime: player.currentTime,
            MPMediaItemPropertyPlaybackDuration: player.duration,
            MPNowPlayingInfoPropertyPlaybackRate: playbackRate
        ]
    }

    func seekToProgress(_ progress: Double) {
        guard let player = player, player.duration > 0 else { return }
        let newTime = progress * player.duration
        player.currentTime = newTime
        self.progress = player.currentTime / player.duration
        updateNowPlaying(playbackRate: player.isPlaying ? 1 : 0)
    }
}
