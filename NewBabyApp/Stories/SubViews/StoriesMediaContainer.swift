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
                progress: Binding(
                    get: {
                        guard viewModel.selectedStory < viewModel.videoProgressGroup.count else { return 0.0 }
                        return viewModel.videoProgressGroup[viewModel.selectedStory]
                    },
                    set: { newValue in
                        guard viewModel.selectedStory < viewModel.videoProgressGroup.count else { return }
                        viewModel.videoProgressGroup[viewModel.selectedStory] = newValue
                    }
                )
            )
            .allowsHitTesting(false)
            
            StoriesControls(
                onTapPrevious: { viewModel.handleTapPrevious() },
                onTapNext: { viewModel.advanceToNextStory() },
                onTapAndHold: { viewModel.togglePause() }
            )
        }
    }
}

private struct StoriesMediaView: View {
    var story: Story
    var proxy: GeometryProxy
    @Binding var progress: Double
    
    var body: some View {
        if story.type == .video {
            Color.clear
                .overlay(
                    VideoPlayerView(videoName: story.sourceName, progress: $progress)
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(
                            width: proxy.size.width,
                            height: proxy.size.height
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .scaledToFill()
                        .clipped()
                )
                .clipShape(clipShape)
                .ignoresSafeArea()
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
            }
        }
    }
    
    var clipShape: some Shape {
        UnevenRoundedRectangle(topLeadingRadius: 30, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 30, style: .circular)
    }
}
