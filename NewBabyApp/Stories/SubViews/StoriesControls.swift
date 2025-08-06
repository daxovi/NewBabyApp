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
    let onLongPressStart: () -> Void
    let onLongPressEnd: () -> Void
    
    @State private var isLongPressing = false
    
    var body: some View {
        HStack(spacing: 0) {
            Color.black.opacity(0.01)
                .onTapGesture(perform: onTapPrevious)
            
            Color.black.opacity(0.01)
                .gesture(
                    DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onChanged { _ in
                            if !isLongPressing {
                                isLongPressing = true
                                onLongPressStart()
                            }
                        }
                        .onEnded { _ in
                            if isLongPressing {
                                isLongPressing = false
                                onLongPressEnd()
                            }
                        }
                )
            
            Color.black.opacity(0.01)
                .onTapGesture(perform: onTapNext)
        }
    }
}
