//
//  TextModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 17.10.2024.
//

import SwiftUI

struct TextModel: Identifiable, Hashable, MenuItemModel {
    var id = UUID()
    // data pro zobrazení v menu aplikace
    var title: String
    var bannerName: String?
    
    func getBanner() -> Image? {
        // Bezpečné rozbalení optional stringu
        guard let bannerName = bannerName else {
            return nil
        }
        return Image(bannerName)
    }
    
    var imageName: String?
    var text: String

}
