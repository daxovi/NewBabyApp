//
//  MenuBackground.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 02.07.2025.
//

import SwiftUI

struct MenuBackground: View {
    var imageName: String
    @Binding var scrollPosition: CGFloat
    
    var body: some View {
        ZStack {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .opacity(Double(scrollPosition - 100) * 0.01)
//                    .blur(radius: (300 - scrollPosition) * 0.1)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
        #if DEBUG
        .onChange(of: scrollPosition) { _ in
                print("DEBUG: Scroll position changed: \(scrollPosition)")
            print("DEBUG: Opacity changed: \(Double(scrollPosition - 100) * 0.01)")
        }
        #endif
    }
}
