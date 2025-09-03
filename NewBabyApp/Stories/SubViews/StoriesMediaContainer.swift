//
//  StoriesMediaContainer.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 01.08.2025.
//

import SwiftUI

struct StoriesMediaContainer: View {
    let story: Story
    let proxy: GeometryProxy
    @ObservedObject var viewModel: StoriesViewModel
    
    var body: some View {
        ZStack {
            Color.background
            
            StoriesMediaView(
                story: story,
                proxy: proxy,
                storiesGroup: viewModel.storiesGroup.stories,
                progress: Binding(
                    get: {
                        guard viewModel.selectedStory < viewModel.videoProgressGroup.count else { return 0.0 }
                        return viewModel.videoProgressGroup[viewModel.selectedStory]
                    },
                    set: { newValue in
                        guard viewModel.selectedStory < viewModel.videoProgressGroup.count else { return }
                        viewModel.videoProgressGroup[viewModel.selectedStory] = newValue
                    }
                ),
                shouldRestart: $viewModel.shouldRestartVideo,
                isPaused: $viewModel.isPaused
            )
            .allowsHitTesting(false)
            
            StoriesControls(
                onTapPrevious: { viewModel.handleTapPrevious() },
                onTapNext: { viewModel.advanceToNextStory() },
                onLongPressStart: { viewModel.startPause() },
                onLongPressEnd: { viewModel.endPause() }
            )
        }
    }
}

private struct StoriesMediaView: View {
    var story: Story
    var proxy: GeometryProxy
    var storiesGroup: [Story]
    @Binding var progress: Double
    @Binding var shouldRestart: Bool
    @Binding var isPaused: Bool
    
    var body: some View {
        if story.type == .video {
            Color.clear
                .overlay(
                    VideoPlayerView(
                        videoName: story.sourceName,
                        storiesGroup: storiesGroup, 
                        progress: $progress,
                        shouldRestart: $shouldRestart,
                        isPaused: $isPaused
                    )
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(
                            width: proxy.size.width,
                            height: proxy.size.height
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .scaledToFill()
                        .clipped()
                        .id(story.sourceName) // Add unique ID for smooth transitions
                )
                .clipShape(clipShape)
                .ignoresSafeArea()
                .transition(.opacity) // Add smooth opacity transition
        } else {
            if let image = getImage(imageName: story.sourceName) {
                Color.clear
                    .overlay(
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(maxHeight: .infinity)
                            .clipped()
                    )
                    .clipShape(clipShape)
                    .ignoresSafeArea()
                    .transition(.opacity) // Add smooth opacity transition for consistency
            }
        }
    }
    
    var clipShape: some Shape {
        UnevenRoundedRectangle(topLeadingRadius: 30, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 30, style: .circular)
    }
}
