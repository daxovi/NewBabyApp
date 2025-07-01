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
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    SearchResultRow(
        item: NavigationSearchItem(destination: .introText(IntroTextModel(title: "Ukázka", content: AttributedString("Text"))),
        repo: SearchRepository()
    )
}
