//
//  VideoTabView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 22.10.2024.
//
import SwiftUI
import _AVKit_SwiftUI

struct VideoTabView: View {
    var videoName: String
    @StateObject var videoPlayerViewModel: VideoPlayerViewModel
    @Binding var progress: Double // Binding pro přenos progressu do ContentView

    init(videoName: String, progress: Binding<Double>) {
        _videoPlayerViewModel = StateObject(wrappedValue: VideoPlayerViewModel(videoName: videoName))
        _progress = progress
        self.videoName = videoName
    }

    var body: some View {
            VideoPlayer(player: videoPlayerViewModel.player)

                .onAppear {
                    videoPlayerViewModel.restart()
                }
                .onDisappear {
                    videoPlayerViewModel.pause()
                }
                .onReceive(videoPlayerViewModel.$currentProgress) { newProgress in
                    progress = newProgress // Aktualizace bindingu v ContentView
                }
    }
    
}
