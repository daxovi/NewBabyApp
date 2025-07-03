//
//  LocalRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 09.01.2025.
//
import SwiftUI

class LocalRepository {

    private static func loadMenu(named name: String) -> MenuModel {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else {
            fatalError("Missing resource \(name).json")
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(MenuModel.self, from: data)
        } catch {
            fatalError("Unable to decode \(name): \(error)")
        }
    }

    static let menuPregnant: MenuModel = loadMenu(named: "PregnantRepository")
    static let menuHospital: MenuModel = loadMenu(named: "HospitalRepository")
    static let menuHome: MenuModel = loadMenu(named: "HomeRepository")
}
