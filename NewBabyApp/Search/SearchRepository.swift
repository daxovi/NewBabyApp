//
//  SearchRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 15.06.2025.
//

import Foundation

struct NavigationSearchItem: Identifiable, Hashable {
    let id = UUID()
    let destination: NavigationDestination
}

final class SearchRepository {
    
//    static let repositories: [[NavigationDestination]] = [
//        LocalRepository.iDobaPorodni,
//        LocalRepository.iiDobaPorodni,
//        LocalRepository.iiiDobaPorodni,
//        LocalRepository.ivDobaPorodni,
//        LocalRepository.porod,
//        LocalRepository.zdraviPodKontrolou,
//        LocalRepository.prvniden
//    ]
    
    static let repositories: [[NavigationDestination]] = [
        LocalRepository.menuHospital.menuItems
        ]
    
    func allSearchItems() -> [NavigationSearchItem] {
        LocalRepository.menuHospital.menuItems.flatMap { collectDestinations(from: $0) }
    }

    private func collectDestinations(from destination: NavigationDestination) -> [NavigationSearchItem] {
        var results: [NavigationSearchItem] = [.init(destination: destination)]

        if case let .menu(menuModel) = destination {
            for item in menuModel.menuItems {
                results += collectDestinations(from: item)
            }
        }

        return results
    }
    
//    func allSearchItems() -> [NavigationSearchItem] {
//        var results: [NavigationSearchItem] = []
//
//        for repository in SearchRepository.repositories {
//            for item in repository {
//                results.append(.init(destination: item))
//                if case let .menu(menuModel) = item {
//                    
//                    for menuItem in menuModel.menuItems {
//                        results.append(.init(destination: menuItem))
//                        if case let .menu(submenuModel) = menuItem {
//                            
//                            for submenuItem in submenuModel.menuItems {
//                                results.append(.init(destination: submenuItem))
//                            }
//                        }
//                    }
//                }
//            }
//        }
//
//        return results
//    }

    func filteredItems(for query: String) -> [NavigationSearchItem] {
        guard !query.isEmpty else { return [] }
        let allItems = allSearchItems()
        let lowercasedQuery = query.folding(options: .diacriticInsensitive, locale: .current).lowercased()
        // 1. Přesná shoda v title
        let exactTitleMatches = allItems.filter {
            $0.destination.title.folding(options: .diacriticInsensitive, locale: .current).lowercased() == lowercasedQuery
        }
        // 2. Title obsahuje hledaný výraz (ale není přesná shoda)
        let partialTitleMatches = allItems.filter {
            $0.destination.title.folding(options: .diacriticInsensitive, locale: .current).lowercased().contains(lowercasedQuery)
            && $0.destination.title.folding(options: .diacriticInsensitive, locale: .current).lowercased() != lowercasedQuery
        }
        // 3. Ostatní (fulltext)
        let otherMatches = allItems.filter {
            !$0.destination.title.folding(options: .diacriticInsensitive, locale: .current).lowercased().contains(lowercasedQuery)
            && $0.destination.searchableFulltext.folding(options: .diacriticInsensitive, locale: .current).lowercased().contains(lowercasedQuery)
        }
        return exactTitleMatches + partialTitleMatches + otherMatches
    }
}
