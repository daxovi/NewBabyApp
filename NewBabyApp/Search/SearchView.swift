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
            Group {
                if searchText.isEmpty {
                    VStack {
                        Spacer()
                        Label("Zadejte hledaný text", systemImage: "magnifyingglass")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(filteredResults) { item in
                            NavigationLink(value: item.destination) {
                                SearchResultRow(item: item, repo: repo)
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
