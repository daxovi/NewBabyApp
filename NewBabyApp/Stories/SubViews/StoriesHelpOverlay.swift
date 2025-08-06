//
//  StoriesHelpOverlay.swift
//  NewBabyApp
//
//  Created by Assistant on 06.08.2025.
//

import SwiftUI

struct StoriesHelpOverlay: View {
    @State private var isVisible = true
    let onDismiss: () -> Void
    
    var body: some View {
        if isVisible {
            ZStack {
                // Semi-transparent background
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .onTapGesture {
                        dismissOverlay()
                    }
                
                // Help content
                HStack {
                    // Left side - Previous
                    VStack(spacing: 8) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Text("stories_help_previous".localizedString)
                            .font(.footnote)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    // Right side - Next
                    VStack(spacing: 8) {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Text("stories_help_next".localizedString)
                            .font(.footnote)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 40)
            }
            .onAppear {
                // Auto-dismiss after 4 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    dismissOverlay()
                }
            }
        }
    }
    
    private func dismissOverlay() {
        withAnimation(.easeOut(duration: 0.3)) {
            isVisible = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            onDismiss()
        }
    }
}

#Preview {
    StoriesHelpOverlay(onDismiss: {})
        .background(Color.blue) // Just to see the overlay in preview
}