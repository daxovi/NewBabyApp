import SwiftUI

struct PorodRepository {
    static let porod: [NavigationDestination] = Bundle.main.decode([NavigationDestination].self, from: "porod.json")
}
