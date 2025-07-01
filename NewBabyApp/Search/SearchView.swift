//
//  SearchView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 15.06.2025.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    private let repo = SearchRepository()

    var filteredResults: [NavigationSearchItem] {
        repo.filteredItems(for: searchText)
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredResults) { item in
                    NavigationLink(value: item.destination) {
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
            }
            .searchable(text: $searchText)
            .navigationTitle("Vyhledávání")
            .navigationDestination(for: NavigationDestination.self) { destination in
                destination.getSwiftUIView()
            }
        }
    }
}

#Preview {
    SearchView()
}
