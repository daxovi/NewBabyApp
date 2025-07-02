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
    @Published var waveformSamples: [Float] = []
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
            self.waveformSamples = Self.loadWaveformSamples(url: url, samplesCount: 100)
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

    static func loadWaveformSamples(url: URL, samplesCount: Int) -> [Float] {
        let asset = AVAsset(url: url)
        guard let track = asset.tracks(withMediaType: .audio).first else { return Array(repeating: 0.1, count: samplesCount) }
        let assetReader = try? AVAssetReader(asset: asset)
        let outputSettings: [String: Any] = [AVFormatIDKey: kAudioFormatLinearPCM,
                                             AVLinearPCMIsBigEndianKey: false,
                                             AVLinearPCMIsFloatKey: true,
                                             AVLinearPCMBitDepthKey: 32]
        let output = AVAssetReaderTrackOutput(track: track, outputSettings: outputSettings)
        assetReader?.add(output)
        assetReader?.startReading()
        var sampleData = [Float]()
        while let buffer = output.copyNextSampleBuffer(),
              let blockBuffer = CMSampleBufferGetDataBuffer(buffer) {
            let length = CMBlockBufferGetDataLength(blockBuffer)
            var data = [Float](repeating: 0, count: length/4)
            CMBlockBufferCopyDataBytes(blockBuffer, atOffset: 0, dataLength: length, destination: &data)
            sampleData.append(contentsOf: data)
        }
        if sampleData.isEmpty { return Array(repeating: 0.1, count: samplesCount) }
        let chunkSize = max(1, sampleData.count / samplesCount)
        var result = [Float]()
        for i in 0..<samplesCount {
            let start = i * chunkSize
            let end = min(start + chunkSize, sampleData.count)
            let chunk = sampleData[start..<end]
            let maxVal = chunk.map { abs($0) }.max() ?? 0
            result.append(maxVal)
        }
        let maxSample = result.max() ?? 1
        return result.map { max(0.05, $0 / maxSample) }
    }
}
