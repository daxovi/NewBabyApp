//
//  MenuItemView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 02.07.2025.
//

import SwiftUI

struct MenuItemView: View {
    let menuItem: NavigationDestination
    
    var body: some View {
        VStack {
            switch menuItem {
            case .stories(let model):
                MenuItem(item: model)
            case .text(let model):
                MenuItem(item: model)
            case .menu(let model):
                MenuItem(item: model)
            case .introText(let model):
                IntroTextView(model: model)
            case .podcast(let model):
                PodcastView(model: model)
            }
            
            if menuItem.needSpace() {
                Color.clear.frame(height: 10)
            }
        }
    }
}
