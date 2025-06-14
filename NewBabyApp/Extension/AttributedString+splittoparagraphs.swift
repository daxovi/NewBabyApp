//
//  AttributedString+splittoparagraph.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 14.06.2025.
//

import Foundation

extension AttributedString {
    /// Rozdělí AttributedString na pole odstavců podle zadaného separátoru, přičemž zachová veškeré původní atributy (tučné, kurzíva apod.).
    /// - Parameter separator: Řetězec, podle kterého se rozdělí (např. "\n" nebo "\n\n").
    /// - Returns: Pole AttributedString, kde každý prvek je jeden odstavec s plným formátováním.
    func splitToParagraphs(separator: String = "\n") -> [AttributedString] {
        // Převedeme AttributedString na NSAttributedString pro práci s rozsahy
        let nsFull = NSAttributedString(self)
        let fullString = nsFull.string as NSString
        // Rozdělíme čistý text podle separátoru
        let parts = fullString.components(separatedBy: separator)
        var result: [AttributedString] = []
        var location = 0

        for part in parts {
            // Délka segmentu v UTF-16 znacích
            let length = (part as NSString).length
            // Vytvoříme range v původním NSAttributedString
            let range = NSRange(location: location, length: length)
            // Vyjmutí odpovídající části včetně všech atributů
            let sub = nsFull.attributedSubstring(from: range)
            
            // Konverze na AttributedString (non-throwing initializer)
            let attributed = AttributedString(sub)
            result.append(attributed)

            // Posuneme se o délku segmentu + délku separátoru
            location += length + (separator as NSString).length
        }
        return result
    }
}
