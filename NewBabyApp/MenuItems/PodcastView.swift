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
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                Text(model.title)
                    .textStyle(.smallTitle)
                Spacer()
                Text("\(PodcastView.formatTime(viewModel.progress * viewModel.duration))/\(PodcastView.formatTime(viewModel.duration))")
                    .textStyle(.bodyPrimary)
            }
            HStack(spacing: 20) {
                Button(action: { viewModel.togglePlay() }) {
                    Image(systemName: viewModel.isPlaying ? "pause.circle" : "play.circle")
                        .font(.largeTitle)
                }
                if viewModel.isLoadingWaveform {
                    ProgressView()
                        .frame(height: 48)
                        .frame(maxWidth: .infinity)
                } else {
                    WaveformView(
                        samples: viewModel.waveformSamples,
                        progress: viewModel.progress,
                        onSeek: { rel in
                            viewModel.isSeeking = false
                            viewModel.seekToProgress(rel)
                        },
                        onSeekUpdate: { rel in
                            viewModel.updateCurrentTime(rel)
                        }
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
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
            MenuItem(item: StoriesModel(title: "Ahoj", bannerName: "vase-cesta-porodem-0", stories: []))
            VStack (spacing: 0) {
                MenuItem(item: StoriesModel(title: "Ahoj", stories: []))
                MenuItem(item: StoriesModel(title: "Ahoj", stories: []))
                MenuItem(item: StoriesModel(title: "Ahoj", stories: []))
            }
                .clipShape(RoundedRectangle(cornerRadius: 10))
            MenuItemView(menuItem: .podcast(PodcastModel(title: "Ukázkový podcast", fileName: "bonding")))

        }
        .padding()
    }
    .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
    .background(Color.background)
}
