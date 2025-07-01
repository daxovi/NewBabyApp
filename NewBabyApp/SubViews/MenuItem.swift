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
                ZStack {
                    Color.bannerBlurPink

                    image
                        .resizable()
                        .scaledToFill()
                    
                    VStack {
                        Spacer()
                        HStack {
                            Text(item.title)
                                .textStyle(.bannerOverlay)
                                .multilineTextAlignment(.leading)
                                .padding()
                            Spacer()
                        }
                        .padding(.top, 50)
                        .background {
                            ZStack {
                                
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask {
                                        LinearGradient(colors: [
                                            .white.opacity(0),
                                            .white.opacity(0.8),
                                            .white
                                        ], startPoint: .top, endPoint: .bottom)
                                    }
                                LinearGradient(colors: [
                                    .bannerBlurPink.opacity(0),
//                                    .bannerBlurPink.opacity(0.8),
                                    .bannerBlurPink.opacity(1)
                                ], startPoint: .top, endPoint: .bottom)
                                .padding(.top, 0)
                                .blendMode(.overlay)
                            }
                        }
                    }

                }
                .background(.bannerBlurPink)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                VStack(spacing: 0) {
                    HStack(alignment: .center) {
                        Text("\(item.title)")
                            .lineLimit(1)
                        Spacer()
                        Image(systemName: "chevron.right")
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

#Preview {
    VStack {
        MenuItem(item: StoriesModel(title: "Ahoj", bannerName: "vase-cesta-porodem-0", stories: []))
    }
    .padding()
}
