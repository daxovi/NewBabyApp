//
//  String+folded.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 16.06.2025.
//

extension String {
    var folded: String {
        folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
    }

    func containsFolded(_ other: String) -> Bool {
        folded.contains(other.folded)
    }
}
