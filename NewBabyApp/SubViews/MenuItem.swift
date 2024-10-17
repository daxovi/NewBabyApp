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
        if item.bannerName == nil {
                  NavigationLink("\(item.title)", value: item)
        } else {
            if let image = item.getBanner() {
                image
                    .resizable()
                    .scaledToFit()
                    .background(
                        NavigationLink(value: item) {
                            Text("\(item.title)")
                        }
                        .opacity(0)
                    )
                    .overlay {
                        HStack {
                            VStack {
                                Spacer()
                                Text("\(item.title)")
                            }
                            Spacer()
                        }
                        .padding()
                    }
                    .listRowInsets(EdgeInsets())
            } else {
                Color.white
            }
        }
    }
}
