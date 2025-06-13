//
//  String+localization.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 13.06.2025.
//

import Foundation

#if !BARTY_CROUCH
extension String {
    /// Vrátí lokalizovaný řetězec podle klíče
    var localizedString: String {
        NSLocalizedString(self, comment: "")
    }

    /// Vrátí lokalizovaný řetězec podle klíče s vlastním komentářem
    /// - Parameter comment: Komentář pro překladatele
    /// - Returns: Lokalizovaný řetězec
    func localizedString(comment: String) -> String {
        NSLocalizedString(self, comment: comment)
    }

    /// Vrátí lokalizovaný řetězec podle klíče a vloží parametry do formátu
    /// - Parameter args: Parametry pro String(format:)
    /// - Returns: Lokalizovaný a formátovaný řetězec
    func localizedString(_ args: CVarArg...) -> String {
        let format = NSLocalizedString(self, comment: "")
        return String(format: format, arguments: args)
    }

    /// Vrátí lokalizovaný řetězec podle klíče s komentářem a parametry
    /// - Parameters:
    ///   - comment: Komentář pro překladatele
    ///   - args: Parametry pro String(format:)
    /// - Returns: Lokalizovaný a formátovaný řetězec
    func localizedString(comment: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(self, comment: comment)
        return String(format: format, arguments: args)
    }
}

// Příklad použití:
// let welcome = "welcome_message".localizedString
// let logout  = "logout_button".localizedString(comment: "Tlačítko pro odhlášení")
#endif
