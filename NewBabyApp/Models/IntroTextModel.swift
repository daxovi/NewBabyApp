//
//  IntroTextModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 28.04.2025.
//

import SwiftUI

struct IntroTextModel: Identifiable, Hashable, MenuItemModel {
    var id = UUID()
    // data pro zobrazení v menu aplikace
    var title: String
    var content: AttributedString
    var isCollapsable: Bool = false
    
    let bannerName: String? = nil
    let isHalf: Bool = false
    let needSpace: Bool = true

    func getBanner() -> Image? {
        return nil
    }
    

    /*
     Model musí obsahovat:
     Array video souborů nebo obrázků
     ke každému videu a obrázku text
     nakonec markdown dokument
     
     Informace pro menu:
     informace o tom jestli je to obrázkový banner nebo textový
     
     Musí být vyřešené zobrazení obrázků i videí v jednom array
     Nesmí se rozbít když nebude předaný titulek k videu/obrázku
     
     Markdown musíá kombinovat texty a obrázky
     */
}
