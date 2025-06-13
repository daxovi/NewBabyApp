//
//  HomeRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 22.04.2025.
//
import SwiftUI

extension LocalRepository {
    
    static let menuHome = MenuModel(
        title: "title_jsmedoma".localizedString,
        subtitle: "subtitle_jsmedoma".localizedString,
        backgroundImageName: "title-home".localizedString,
        menuItems: [
            .detail(DetailModel(title: "title_podporaprorodice".localizedString, bannerName: "podpora-pro-rodice")),
            .detail(DetailModel(title: "title_bezpeci".localizedString, bannerName: "bezpeci")),
            .detail(DetailModel(title: "title_energieprodva".localizedString, bannerName: "energie-pro-dva")),
            .detail(DetailModel(title: "title_kojenidoma".localizedString, bannerName: "kojeni-doma"))
        ]
    )
}
