//
//  PodcastViewModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 02.07.2025.
//

import AVFoundation
import MediaPlayer
import SwiftUI
import Combine

class PodcastViewModel: NSObject, ObservableObject {
    @Published var isPlaying: Bool = false
    @Published var progress: Double = 0
    @Published var waveformSamples: [Float] = []
    @Published var isSeeking: Bool = false
    @Published var isLoadingWaveform: Bool = false
    @Published var currentTime: TimeInterval = 0
    @Published var duration: TimeInterval = 0

    let audioManager = AudioManager.shared
    private var cancellables = Set<AnyCancellable>()

    private let fileName: String
    private let title: String

    init(fileName: String, title: String) {
        self.fileName = fileName
        self.title = title
        super.init()
        bindToAudioManager()
    }

    func updateCurrentTime(_ relativeProgress: Double) {
        guard duration > 0 else { return }
        currentTime = relativeProgress * duration
    }

    func setup() {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            isLoadingWaveform = true
            DispatchQueue.global(qos: .userInitiated).async {
                let samples = Self.loadWaveformSamples(url: url, samplesCount: 100)
                DispatchQueue.main.async {
                    self.waveformSamples = samples
                    self.isLoadingWaveform = false
                }
            }

            // Load duration
            if let asset = try? AVAudioPlayer(contentsOf: url) {
                self.duration = asset.duration
            }
        }
    }

    func togglePlay() {
        audioManager.togglePlay(fileName: fileName, title: title.localizedString)
    }

    func teardown() {
        // intentionally left blank so audio can continue playing
    }
    private func bindToAudioManager() {
        audioManager.$isPlaying
            .combineLatest(audioManager.$currentFile)
            .sink { [weak self] playing, file in
                guard let self else { return }
                self.isPlaying = playing && file == self.fileName
            }
            .store(in: &cancellables)

        audioManager.$progress
            .sink { [weak self] value in
                guard let self else { return }
                if self.audioManager.currentFile == self.fileName && !self.isSeeking {
                    self.progress = value
                } else if self.audioManager.currentFile != self.fileName {
                    self.progress = 0
                }
            }
            .store(in: &cancellables)
    }

    func seekToProgress(_ progress: Double) {
        guard audioManager.currentFile == fileName else { return }
        audioManager.seek(to: progress)
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
        
        // Vylepšený algoritmus pro lepší kontrast
        let maxSample = result.max() ?? 1
        let threshold = maxSample * 0.15 // Práh pro slabé signály
        
        return result.map { sample in
            let normalized = sample / maxSample
            
            // Aplikujeme logaritmickou křivku pro lepší kontrast
            let logarithmic = log10(normalized * 9 + 1) // log10(1) = 0, log10(10) = 1
            
            // Zvýšíme kontrast pomocí power funkce
            let enhanced = pow(logarithmic, 0.7)
            
            // Minimální výška pro velmi slabé signály
            let minHeight: Float = sample < threshold ? 0.05 : 0.15
            
            return max(minHeight, min(1.0, enhanced))
        }
    }
}
