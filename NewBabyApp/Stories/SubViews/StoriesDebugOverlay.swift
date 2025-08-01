//
//  StoriesDebugOverlay.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 01.08.2025.
//

import SwiftUI

#if DEBUG
struct StoriesDebugOverlay: View {
    let currentStory: Story?
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    Text("image: \(currentStory?.sourceName ?? "")")
                        .font(.caption)
                }
                .padding(10)
                .background(Color.white.opacity(0.7))
                .padding(5)
                
                Spacer()
            }
        }
    }
}
#endif
