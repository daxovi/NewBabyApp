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
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(.clear)
                        .background{
                            image
                                .resizable()
                                .scaledToFill()
                        }
                        .clipped()

                    HStack {
                        Text(item.title)
                            .multilineTextAlignment(.leading)
                            .padding()
                        Spacer(minLength: 0)
                        Image(systemName: "chevron.right")
                            .foregroundStyle(ColorStyling.uiColor)
                            .padding()
                    }
                }
                .background(.white)
                .frame(height: item.isHalf ? 170 : 220)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                VStack(spacing: 0) {
                    HStack(alignment: .center) {
                        Text("\(item.title)")
                            .lineLimit(1)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(ColorStyling.uiColor)
                    }
                    .padding()
                    Divider()
                        .padding(.vertical, 1)
                }
                .background(Color.white)
            }
        }
        .foregroundColor(.black)
    }

    private func mapToDestination(_ item: any MenuItemModel) -> NavigationDestination {
        if let storiesItem = item as? StoriesModel {
            return .stories(storiesItem)
        } else if let textItem = item as? TextModel {
            return .text(textItem)
        } else if let menuItem = item as? MenuModel {
            return .menu(menuItem)
        } else {
            fatalError("Neznámý typ MenuItemModel")
        }
    }
}
//
//#Preview {
//    ScrollView {
//        VStack(spacing: 20) {
//            MenuItem(item: StoriesModel(title: "Ahoj", bannerName: "vase-cesta-porodem-0", stories: []))
//            VStack (spacing: 0) {
//                MenuItem(item: StoriesModel(title: "Ahoj", stories: []))
//                MenuItem(item: StoriesModel(title: "Ahoj", stories: []))
//                MenuItem(item: StoriesModel(title: "Ahoj", stories: []))
//            }
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//
//        }
//        .padding()
//    }
//    .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
//    .background(Color.background)
//}
