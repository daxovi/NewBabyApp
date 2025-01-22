//
//  MenuItem.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 14.10.2024.
//

import SwiftUI

struct MenuItem: View {
    var item: any MenuItemModel

    var body: some View {
        NavigationLink(value: mapToDestination(item)) {
            if let image = item.getBanner() {
                image
                    .resizable()
                    .scaledToFit()
                    .overlay {
                        ZStack {
                            LinearGradient(colors: [ // TODO: vyzkoušet nastavení rozmazání .thinMaterial
                                .black.opacity(0),
                                .black.opacity(0),
                                .black.opacity(0.5)
                            ], startPoint: .top, endPoint: .bottom)
                            HStack {
                                VStack {
                                    Spacer()
                                    Text("\(item.title)")
                                        .padding()
                                        .foregroundStyle(.white)
                                }
                                Spacer()
                            }
                        }
                    }
            } else {
                HStack {
                    Text("\(item.title)")
                    Spacer()
                }
                .padding()
                .background(Color.white)
            }
        }
        .foregroundColor(.black)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }

    private func mapToDestination(_ item: any MenuItemModel) -> NavigationDestination {
        if let storiesItem = item as? StoriesModel {
            return .stories(storiesItem)
        } else if let textItem = item as? TextModel {
            return .text(textItem)
        } else if let menuItem = item as? MenuModel {
            return .menu(menuItem)
        } else if let detailItem = item as? DetailModel {
            return .detail(detailItem)
        } else {
            fatalError("Neznámý typ MenuItemModel")
        }
    }
}
