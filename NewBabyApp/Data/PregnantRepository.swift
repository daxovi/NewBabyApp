//
//  PregnantRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 22.04.2025.
//
import SwiftUI

extension LocalRepository {
    
    static let menuPregnant = MenuModel(
        title: "title_cekamemiminko".localizedString,
        subtitle: "subtitle_cekamemiminko".localizedString,
        backgroundImageName: "title-pregnant",
        menuItems: [
            .detail(DetailModel(title: "title_predporodnikurzy".localizedString, bannerName: "predporodni-kurzy")),
            .detail(DetailModel(title: "title_screeningy".localizedString, bannerName: "screeningy")),
            .detail(DetailModel(title: "title_nastandardnikurzy".localizedString, bannerName: "sluzby")),
            .detail(DetailModel(title: "title_porod".localizedString, bannerName: "porod"))
        ]
    )
}
