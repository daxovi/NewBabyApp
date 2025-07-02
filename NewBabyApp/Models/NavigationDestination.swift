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
    case introText(IntroTextModel)
    case podcast(PodcastModel)

    func hash(into hasher: inout Hasher) {
        switch self {
        case .stories(let model):
            hasher.combine(model.id)
        case .text(let model):
            hasher.combine(model.id)
        case .menu(let model):
            hasher.combine(model.id)
        case .introText(let model):
            hasher.combine(model.id)
        case .podcast(let model):
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
        case .introText(_):
            return true
        case .podcast(let model):
            return true
        case .podcast(let model):
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
        case .introText(_):
            return true
        case .podcast(let model):
            return true
        }
    }
    
    func isHalf() -> Bool {
            switch self {
            case .stories(let model): return model.isHalf
            case .text(let model): return model.isHalf
            case .menu(let model): return model.isHalf
            case .introText(_): return false
            case .podcast(_): return false
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
        case (.introText(let lhsModel), .introText(let rhsModel)):
            return lhsModel.id == rhsModel.id
        case (.podcast(let lhsModel), .podcast(let rhsModel)):
            return lhsModel.id == rhsModel.id
        default:
            return false
        }
    }
}

extension NavigationDestination {
    var iconName: String {
        switch self {
        case .menu:
            return "list.bullet"
        case .introText:
            return "text.justify"
        case .stories(let model):
            if model.stories.contains(where: { $0.type == .video }) {
                return "play.rectangle"
            } else {
                return "photo.on.rectangle"
            }
        case .podcast:
                    return "headphones"
        case .text:
            return "doc.text"
        }
    }
}

// MARK: - Search
extension NavigationDestination {
    
    var searchableFulltext: String {
        switch self {
        case .introText(let model):
            return String(model.title + " " + model.content.characters)
        case .stories(let model):
            var text: String = ""
            for story in model.stories {
                text.append(contentsOf: story.text)
            }
            return model.title + " " + text
        case .menu(let menuModel):
            return menuModel.title + " " + (menuModel.menuItems.map { $0.searchableFulltext }.joined(separator: " "))
        case .podcast(let model):
                    return model.title
        default:
            return ""
        }
    }
    
    var searchableText: String {
        switch self {
        case .introText(let model):
            return String(model.content.characters)
        case .stories(let model):
            var text: String = ""
            for story in model.stories {
                text.append(contentsOf: story.text + " ")
            }
            return text
        case .menu(let menuModel):
            return menuModel.title + " " + (menuModel.menuItems.map { $0.searchableText }.joined(separator: " "))
        case .podcast(let model):
                    return model.title
        default:
            return ""
        }
    }

    var title: String {
        switch self {
        case .introText(let model):
            return model.title
        case .stories(let model):
            return model.title
        case .menu(let menuModel):
            return menuModel.title
        case .podcast(let model):
                    return model.title
        default:
            return ""
        }
    }
}

extension NavigationDestination {
    
    @ViewBuilder
    func getSwiftUIView() -> some View {
        switch self {
        case .stories(let group):
            StoriesView(storiesGroup: group)
        case .introText(let intro):
            findParent(for: intro)
        case .menu(let menuModel):
            MenuView(model: menuModel, clientName: nil, path: .constant(NavigationPath()))
        case .text(let model):
            TextView(model: model)
        case .podcast(let model):
            findParent(for: model)
        }
    }
    
    func findParent(for model: any MenuItemModel) -> AnyView {
        for repository in LocalRepository.menuHospital.menuItems {
            if case let .menu(menuIModel) = repository {
                for item in menuIModel.menuItems {
                    if case let .introText(introTextModel) = item, introTextModel.id == model.id {
                        return AnyView(MenuView(model: menuIModel, clientName: "", path: .constant(NavigationPath())))
                    }
                    if case let .podcast(podcastModel) = item, podcastModel.id == model.id {
                        return AnyView(MenuView(model: menuIModel, clientName: "", path: .constant(NavigationPath())))
                    }
                if case let .menu(menuModel) = item {
                    for menuItem in menuModel.menuItems {
                        if case let .introText(infoTextModel) = menuItem, infoTextModel.id == model.id {
                            return AnyView(MenuView(model: menuModel, clientName: "", path: .constant(NavigationPath())))
                        }
                        if case let .podcast(podcastModel) = menuItem, podcastModel.id == model.id {
                            return AnyView(MenuView(model: menuModel, clientName: "", path: .constant(NavigationPath())))
                        }
                    }
                }
            }
            }
        }
        return AnyView(EmptyView())
    }
}
