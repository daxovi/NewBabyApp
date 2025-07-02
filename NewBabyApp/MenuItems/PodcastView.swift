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

    var body: some View {
        VStack(spacing: 20) {
            Text(model.title)
                .font(.title2)
            Slider(value: $viewModel.progress, onEditingChanged: { editing in
                viewModel.isSeeking = editing
                if !editing {
                    viewModel.seekToProgress(viewModel.progress)
                }
            })
            Button(action: { viewModel.togglePlay() }) {
                Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                    .font(.largeTitle)
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
            MenuItemView(menuItem: .podcast(PodcastModel(title: "Ukázkový podcast", fileName: "sample")))

        }
        .padding()
    }
    .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
    .background(Color.background)
}
