//
//  PodcastView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 02.07.2025.
//

import SwiftUI

struct PodcastView: View {
    let model: PodcastModel
    @StateObject private var viewModel: PodcastViewModel
    
    init(model: PodcastModel) {
        self.model = model
        _viewModel = StateObject(wrappedValue: PodcastViewModel(fileName: model.fileName, title: model.title))
    }
    
    private var timeText: String = "" // Added to store formatted time

    static func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack{
                Text(model.title)
                    .textStyle(.smallTitle)
                Spacer()
                Text("\(PodcastView.formatTime(viewModel.progress * viewModel.duration))/\(PodcastView.formatTime(viewModel.duration))")
                    .textStyle(.bodyPrimary)
            }
            Divider()
            HStack(spacing: 20) {
                Button(action: { viewModel.togglePlay() }) {
                    Image(systemName: viewModel.isPlaying ? "pause.circle" : "play.circle")
                        .font(.largeTitle)
                }
                WaveformView(
                    samples: viewModel.waveformSamples,
                    progress: viewModel.progress,
                    onSeek: { rel in
                        viewModel.isSeeking = false
                        viewModel.seekToProgress(rel)
                    },
                    onSeekUpdate: { rel in
                        viewModel.updateCurrentTime(rel)
                    },
                    isPlaceholder: viewModel.isLoadingWaveform,
                    numberOfBars: 60
                )
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            if !model.source.isEmpty {
                Text(model.source)
                    .font(.callout)
            }
        }
        .padding()
        .onAppear { viewModel.setup() }
        .onDisappear { viewModel.teardown() }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 20) {
            MenuItemView(menuItem: .podcast(PodcastModel(title: "Ukázkový podcast", source: "Zdroj", fileName: "kojeni")))
        }
        .padding()
    }
    .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
    .background(Color.background)
}
