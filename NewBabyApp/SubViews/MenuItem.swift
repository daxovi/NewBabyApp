//
//  MenuItem.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 14.10.2024.
//

import SwiftUI

struct MenuItem: View {
    var detail: DetailModel
    @Binding var path: NavigationPath

    var body: some View {
        if detail.bannerName == nil {
            NavigationLink("\(detail.title)", value: detail)
        } else {
            if let image = detail.getBanner() {
                image
                    .resizable()
                    .scaledToFit()
                    .background(
                        NavigationLink(value: detail) {
                            Text("\(detail.title)")
                        }
                        .opacity(0)
                    )
                    .overlay {
                        HStack() {
                            VStack {
                                Spacer()
                                Text("\(detail.title)")
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
