//
//  PodcastModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 02.07.2025.
//

import SwiftUI

struct PodcastModel: Identifiable, Hashable, MenuItemModel, Codable {
    var id = UUID()
    /// Title visible in menu and now playing info
    var title: String
    /// Name of the audio file in app bundle without extension
    var fileName: String
    /// Optional banner image displayed in menu
    var bannerName: String? = nil
    var isHalf: Bool = false
    var needSpace: Bool { bannerName != nil }

    func getBanner() -> Image? {
        return nil
    }
}
