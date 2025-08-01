import SwiftUI

struct SearchResultRow: View {
    let item: NavigationSearchItem
    let repo: SearchRepository

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: item.destination.iconName)
                .frame(width: 20)
            VStack(alignment: .leading) {
                Text(item.destination.title)
                    .font(.headline)
                Text(repo.subtitle(for: item.destination))
                    .textStyle(.textContent)
                    .lineLimit(2)
            }
        }
    }
}
//
//#Preview {
//    NavigationStack {
//        let repo = SearchRepository()
//        let items: [NavigationSearchItem] = [
//            .init(destination: .introText(
//                IntroTextModel(title: "Intro", content: AttributedString("Intro text"))
//            )),
//            .init(destination: .stories(
//                StoriesModel(title: "Video stories", stories: [
//                    Story(type: .video, sourceName: "video.mp4", text: "Video")
//                ])
//            )),
//            .init(destination: .stories(
//                StoriesModel(title: "Image stories", stories: [
//                    Story(type: .image, sourceName: "image.png", text: "Image")
//                ])
//            )),
//            .init(destination: .menu(
//                MenuModel(title: "Menu", menuItems: [
//                    .introText(IntroTextModel(title: "Intro", content: AttributedString("Intro text"))),
//                ])
//            ))
//        ]
//        List {
//            ForEach(items) { item in
//                NavigationLink(value: item.destination) {
//                    SearchResultRow(item: item, repo: repo)
//                }
//            }
//        }
//        .navigationDestination(for: NavigationDestination.self) { destination in
//            destination.getSwiftUIView()
//        }
//    }
//}
