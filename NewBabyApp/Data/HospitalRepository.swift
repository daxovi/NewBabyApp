import SwiftUI

struct HospitalRepository: RepositorySection {
    let menu: MenuModel

    init() {
        self.menu = Bundle.main.decode(MenuModel.self, from: "hospital.json")
    }
}
