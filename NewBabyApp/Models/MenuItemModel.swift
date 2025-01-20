//
//  MenuItemModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 17.10.2024.
//
import SwiftUI

protocol MenuItemModel: Hashable {
    var id: UUID { get }
    // data pro zobrazení v menu aplikace
    var title: String { get }
    var bannerName: String? { get }
    
    func getBanner() -> Image?
}
