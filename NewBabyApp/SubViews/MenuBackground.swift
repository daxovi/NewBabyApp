//
//  MenuBackground.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 02.07.2025.
//

import SwiftUI

struct MenuBackground: View {    
    var body: some View {
        ZStack {
            VStack {
                Image(.menuBackground)
                    .resizable()
                    .scaledToFit()
//                    .opacity(Double(scrollPosition - 100) * 0.01)
//                    .blur(radius: (300 - scrollPosition) * 0.1)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}
