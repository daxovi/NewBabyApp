//
//  Untitled.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 20.01.2025.
//

import SwiftUI

enum NavigationDestination: Hashable {
    case stories(StoriesModel)
    case text(TextModel)
    case menu(MenuModel)
    case detail(DetailModel)

    func hash(into hasher: inout Hasher) {
        switch self {
        case .stories(let model):
            hasher.combine(model.id)
        case .text(let model):
            hasher.combine(model.id)
        case .menu(let model):
            hasher.combine(model.id)
        case .detail(let model):
            hasher.combine(model.id)
        }
    }
    
    func isBanner() -> Bool {
        switch self {
        case .stories(let model):
            return model.bannerName != nil
        case .text(let model):
            return model.bannerName != nil
        case .menu(let model):
            return model.bannerName != nil
        case .detail(let model):
            return model.bannerName != nil
        }
    }

    static func == (lhs: NavigationDestination, rhs: NavigationDestination) -> Bool {
        switch (lhs, rhs) {
        case (.stories(let lhsModel), .stories(let rhsModel)):
            return lhsModel == rhsModel
        case (.text(let lhsModel), .text(let rhsModel)):
            return lhsModel == rhsModel
        case (.menu(let lhsModel), .menu(let rhsModel)):
            return lhsModel.id == rhsModel.id
        case (.detail(let lhsModel), .detail(let rhsModel)):
            return lhsModel.id == rhsModel.id
        default:
            return false
        }
    }
}
