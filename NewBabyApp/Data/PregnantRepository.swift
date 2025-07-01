//
//  PregnantRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 22.04.2025.
//
import SwiftUI

struct PregnantRepository: RepositorySection {

    let menu: MenuModel

    init() {
        self.menu = Bundle.main.decode(MenuModel.self, from: "pregnant.json")
    }
}
