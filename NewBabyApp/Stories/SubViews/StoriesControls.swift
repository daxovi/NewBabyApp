//
//  StoriesControls.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 01.08.2025.
//

import SwiftUI

struct StoriesControls: View {
    let onTapPrevious: () -> Void
    let onTapNext: () -> Void
    let onTapAndHold: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            Color.black.opacity(0.01)
                .onTapGesture(perform: onTapPrevious)
            
            Color.black.opacity(0.01)
                .onLongPressGesture(
                    minimumDuration: 0.1,
                    perform: onTapAndHold
                )
            
            Color.black.opacity(0.01)
                .onTapGesture(perform: onTapNext)
        }
    }
}
