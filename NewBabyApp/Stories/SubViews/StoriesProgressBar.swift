//
//  StoriesProgressBar.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 01.08.2025.
//

import SwiftUI

struct StoriesProgressBar: View {
    @ObservedObject var viewModel: StoriesViewModel
    
    var body: some View {
        HStack(spacing: 5) {
            ForEach(viewModel.storiesGroup.stories.indices, id: \.self) { index in
                StoriesProgressSegment(
                    isCompleted: index < viewModel.selectedStory,
                    isActive: index == viewModel.selectedStory,
                    progress: viewModel.timerProgress
                )
            }
        }
        .frame(height: 2.4)
        .padding(.horizontal)
    }
}

private struct StoriesProgressSegment: View {
    let isCompleted: Bool
    let isActive: Bool
    let progress: CGFloat
    
    var body: some View {
        GeometryReader { proxy in
            Capsule()
                .fill(.bannerBlurPink.opacity(0.5))
                .overlay(alignment: .leading) {
                    if isActive {
                        Capsule()
                            .fill(.white)
                            .frame(width: proxy.size.width * progress)
                    } else if isCompleted {
                        Capsule()
                            .fill(.white)
                    }
                }
        }
    }
}

