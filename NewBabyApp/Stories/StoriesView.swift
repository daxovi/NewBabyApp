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
    @State private var showHelpOverlay = false
    
    var isShownInModal: Bool
    
    init(storiesGroup: StoriesModel, isShownInModal: Bool = false) {
        _viewModel = StateObject(wrappedValue: StoriesViewModel(storiesGroup: storiesGroup))
        self.isShownInModal = isShownInModal
    }
    
    var body: some View {
        if viewModel.storiesGroup.stories.isEmpty {
            StoriesEmptyView()
        } else {
            ZStack {
                GeometryReader { proxy in
                    VStack(spacing: 8) {
                        StoriesProgressBar(viewModel: viewModel)
                            .padding(.top, 6)
                        
                        StoriesHeader(
                            text: viewModel.currentStory?.text ?? "",
                            onDismiss: { dismiss() }
                        )
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
                
                // Help overlay
                if showHelpOverlay {
                    StoriesHelpOverlay {
                        showHelpOverlay = false
                    }
                }
            }
            .onAppear { 
                viewModel.startTimer()
                
                // Check if we should show help overlay
                if viewModel.shouldShowHelpOverlay() {
                    showHelpOverlay = true
                    viewModel.markHelpOverlayShown()
                }
            }
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
                    type: .video,
                    sourceName: "test-1",
                    text: "Druhá story s videem - test funkcí restartu na levé tapnutí a pauza na tap and hold."
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
