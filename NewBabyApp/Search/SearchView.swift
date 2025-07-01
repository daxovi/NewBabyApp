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
                        VStack(alignment: .leading) {
                            Text(item.destination.title)
                                .font(.headline)
                            if case .menu(let menuModel) = item.destination {
                                // Zobraz pouze obsah podmenu bez titulku
                                Text(menuModel.menuItems.map { $0.searchableText }.joined(separator: " "))
                                    .font(.subheadline)
                                    .lineLimit(2)
                            } else {
                                Text(item.destination.searchableText)
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
