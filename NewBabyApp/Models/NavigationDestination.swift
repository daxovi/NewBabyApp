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
    case introText(IntroTextModel)

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
        case .introText(let model):
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
        case .introText(_):
            return true
        }
    }
    
    func needSpace() -> Bool {
        switch self {
        case .stories(let model):
            return model.needSpace
        case .text(let model):
            return model.needSpace
        case .menu(let model):
            return model.needSpace
        case .detail(let model):
            return model.needSpace
        case .introText(_):
            return true
        }
    }
    
    func isHalf() -> Bool {
            switch self {
            case .stories(let model): return model.isHalf
            case .text(let model): return model.isHalf
            case .menu(let model): return model.isHalf
            case .detail(let model): return model.isHalf
            case .introText(_): return false
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
        case (.introText(let lhsModel), .introText(let rhsModel)):
            return lhsModel.id == rhsModel.id
        default:
            return false
        }
    }
}
