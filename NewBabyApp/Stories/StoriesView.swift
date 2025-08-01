//
//  StoryView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 15.10.2024.
//

import AVKit
import SwiftUI

struct StoriesView: View {
    @StateObject private var viewModel: StoriesViewModel
    @Environment(\.dismiss) var dismiss
    
    init(storiesGroup: StoriesModel) {
        _viewModel = StateObject(wrappedValue: StoriesViewModel(storiesGroup: storiesGroup))
    }
    
    var body: some View {
        if viewModel.storiesGroup.stories.isEmpty {
            StoriesEmptyView()
        } else {
            GeometryReader { proxy in
                VStack(spacing: 8) {
                    StoriesProgressBar(viewModel: viewModel)
                        .padding(.top, 6)
                    
                    HStack(alignment: .top) {
                        Text(viewModel.currentStory?.text ?? "")
                            .textStyle(.bodyPrimary)
                        
                        Spacer(minLength: 24)
                        
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                    }
                    
                    .padding()
                    
                    if let story = viewModel.currentStory {
                        StoriesMediaContainer(
                            story: story,
                            proxy: proxy,
                            viewModel: viewModel
                        )
                    }
                }
                .background(Color.background)
                
                #if DEBUG
                StoriesDebugOverlay(currentStory: viewModel.currentStory)
                #endif
            }
            .onAppear { viewModel.startTimer() }
            .onDisappear { viewModel.stopTimer() }
            .onChange(of: viewModel.shouldDismiss) { newValue in
                if newValue {
                    dismiss()
                }
            }
            .statusBar(hidden: true)
            .toolbar(.hidden, for: .tabBar)
            .navigationBarBackButtonHidden(true)
            .gesture(dragToDismiss)
        }
    }
    
    // MARK: - Actions
    
    private var dragToDismiss: some Gesture {
        DragGesture(minimumDistance: 100)
            .onEnded { value in
                if value.translation.height > 0 {
                    dismiss()
                }
            }
    }
}

#Preview {
    StoriesView(storiesGroup:
        StoriesModel(
            title: "Plánovaný císařský řez",
            bannerName: "placeholder",
            isHalf: true,
            stories: [
                Story(
                    type: .image,
                    sourceName: "placeholder",
                    text: "První story s obrázkem - ukázka toho, jak funguje progress bar a navigace mezi jednotlivými stories."
                ),
                Story(
                    type: .image,
                    sourceName: "placeholder",
                    text: "Druhá story také s obrázkem - můžete kliknout na levou nebo pravou stranu obrazovky pro navigaci."
                ),
                Story(
                    type: .image,
                    sourceName: "placeholder",
                    text: "Třetí a poslední story - po této se automaticky zavře celé zobrazení stories."
                )
            ]
        )
    )
}
