//
//  MenuHeader.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 02.07.2025.
//

import SwiftUI

struct MenuHeader: View {
    var clientName: String?
    var subtitle: String?
    var heartTapAction: (() -> Void)? = nil
    
    @State var isSearchActive: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    if let subtitle, subtitle.count > 0 {
                        Text(subtitle.localizedString)
                            .textStyle(.textContent)
                    }
                }
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        MenuView(
            model: MenuModel(
                title: "První den",
                subtitle: "Váš průvodce prvními okamžiky",
                backgroundImageName: "title-baby",
                menuItems: [
                    .introText(IntroTextModel(
                        title: "Vítejte",
                        content: try! AttributedString(markdown: "Vítejte v aplikaci pro nové rodiče!"),
                        isCollapsable: false
                    )),
                    .stories(StoriesModel(
                        title: "První kroky",
                        bannerName: "banner-bonding",
                        isHalf: true,
                        stories: []
                    )),
                    .podcast(PodcastModel(
                        title: "Podcast pro rodiče",
                        source: "Ukázkový podcast pro nové rodiče",
                        fileName: "sample-audio",
                        bannerName: nil,
                        isHalf: true
                    ))
                ]
            ),
            clientName: "Anna Nováková",
            path: .constant(NavigationPath())
        )
    }
}
