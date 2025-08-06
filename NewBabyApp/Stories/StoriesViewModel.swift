//
//  StoriesViewModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 31.07.2025.
//

import SwiftUI
import Foundation

class StoriesViewModel: ObservableObject {
    @Published var storiesGroup: StoriesModel
    @Published var selectedStory: Int = 0
    @Published var timerProgress: CGFloat = 0.0
    @Published var shouldDismiss: Bool = false
    @Published var videoProgressGroup: [Double] = []
    @Published var isPaused: Bool = false
    @Published var shouldRestartVideo: Bool = false
    @Published var isFirstLaunch: Bool = true
    
    private var timer: Timer?
    private let timerInterval: TimeInterval = 0.02
    private let storyDuration: TimeInterval = 5.0
    
    var currentStory: Story? {
        guard selectedStory < storiesGroup.stories.count else { return nil }
        return storiesGroup.stories[selectedStory]
    }
    
    init(storiesGroup: StoriesModel) {
        self.storiesGroup = storiesGroup
        self.videoProgressGroup = Array(repeating: 0.0, count: storiesGroup.stories.count)
    }
    
    // MARK: - Timer Management
    
    func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { [weak self] _ in
            self?.updateProgress()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func startPause() {
        if !isPaused {
            isPaused = true
            stopTimer()
        }
    }
    
    func endPause() {
        if isPaused {
            isPaused = false
            startTimer()
        }
    }
    
    func togglePause() {
        isPaused.toggle()
        if isPaused {
            stopTimer()
        } else {
            startTimer()
        }
    }
    
    private func updateProgress() {
        guard !isPaused else { return }
        
        // Pro video stories sledujeme progress jinak
        if let story = currentStory, story.type == .video {
            // Video progress se spravuje v VideoPlayerView
            // Timer pokračuje na základě video progressu
            let videoProgress = selectedStory < videoProgressGroup.count ? videoProgressGroup[selectedStory] : 0.0
            timerProgress = CGFloat(videoProgress)
            
            if videoProgress >= 1.0 {
                advanceToNextStory()
            }
        } else {
            // Pro obrázky používáme standardní timer
            timerProgress += CGFloat(timerInterval / storyDuration)
            
            if timerProgress >= 1.0 {
                advanceToNextStory()
            }
        }
    }
    
    // MARK: - Navigation
    
    func advanceToNextStory() {
        isFirstLaunch = false  // Mark as no longer first launch when advancing
        
        if selectedStory < storiesGroup.stories.count - 1 {
            selectedStory += 1
            timerProgress = 0.0
        } else {
            shouldDismiss = true
        }
    }
    
    func handleTapPrevious() {
        isFirstLaunch = false  // Mark as no longer first launch when navigating
        
        if timerProgress > 0.1 {
            // Restart current story
            timerProgress = 0.0
            if selectedStory < videoProgressGroup.count {
                videoProgressGroup[selectedStory] = 0.0
            }
            
            // If current story is a video, trigger video restart
            if let story = currentStory, story.type == .video {
                shouldRestartVideo = true
            }
        } else if selectedStory > 0 {
            // Go to previous story
            selectedStory -= 1
            timerProgress = 0.0
            if selectedStory < videoProgressGroup.count {
                videoProgressGroup[selectedStory] = 0.0
            }
            
            // If previous story is a video, trigger video restart
            if let story = currentStory, story.type == .video {
                shouldRestartVideo = true
            }
        }
    }
    
    // MARK: - Help Overlay Management
    
    func shouldShowHelpOverlay() -> Bool {
        guard isFirstLaunch else { return false }
        
        let overlayCount = UserDefaults.standard.integer(forKey: "storiesHelpOverlayCount")
        return overlayCount < 3
    }
    
    func markHelpOverlayShown() {
        let currentCount = UserDefaults.standard.integer(forKey: "storiesHelpOverlayCount")
        UserDefaults.standard.set(currentCount + 1, forKey: "storiesHelpOverlayCount")
    }
}
