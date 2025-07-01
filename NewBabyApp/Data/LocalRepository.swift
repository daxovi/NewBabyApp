//
//  LocalRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 09.01.2025.
//
import SwiftUI

final class LocalRepository {

    static let hospital = HospitalRepository()
    static let home = HomeRepository()
    static let pregnant = PregnantRepository()

    static let sections: [RepositorySection] = [hospital, home, pregnant]

    static var menuHospital: MenuModel { hospital.menu }
    static var menuHome: MenuModel { home.menu }
    static var menuPregnant: MenuModel { pregnant.menu }

    // Additional helpers can be added here if needed
}
