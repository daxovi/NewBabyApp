//
//  TextStyle.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 21.05.2025.
//
import SwiftUI

/// Základní velikosti písma, ke kterým se vztahuje dynamická velikost textu
enum FontSize {
    /// Největší nadpis
    case largeTitle
    /// Běžný nadpis
    case title
    /// Podnadpis
    case subtitle
    /// Základní text
    case body
    /// Malý popisek
    case caption

    /// Výchozí velikost v bodech
    var value: CGFloat {
        switch self {
        case .largeTitle: return 32
        case .title: return 24
        case .subtitle: return 18
        case .body: return 16
        case .caption: return 13
        }
    }

    /// Systémový `Font.TextStyle` používaný pro dynamické škálování
    var textStyle: Font.TextStyle {
        switch self {
        case .largeTitle: return .largeTitle
        case .title: return .title
        case .subtitle: return .headline
        case .body: return .body
        case .caption: return .caption
        }
    }
}

/// Váha písma
enum FontWeight {
    case light, regular, medium, semibold, bold

    /// Systémová hodnota váhy písma
    var value: Font.Weight {
        switch self {
        case .light: return .light
        case .regular: return .regular
        case .medium: return .medium
        case .semibold: return .semibold
        case .bold: return .bold
        }
    }
}

/// Barvy textů používané v aplikaci
enum TextColor {
    case primary, secondary, danger, inverted

    /// Hodnota barvy pro SwiftUI
    var value: Color {
        switch self {
        case .primary: return .black
        case .secondary: return .gray
        case .danger: return .red
        case .inverted: return .white
        }
    }
}

/// Spojuje velikost, váhu a barvu do konkrétního vzhledu textu
enum TextStyle {
    /// Nadpis na hlavní obrazovce
    case titlePrimary
    /// Vedlejší nadpis nebo popisek
    case subtitleSecondary
    /// Běžný text
    case bodyPrimary
    /// Menší nadpis použitý v menu
    case smallTitle
    /// Výrazný text signalizující chybu
    case boldDanger
    /// Text zobrazený přes obrázek
    case bannerOverlay

    /// Přiřazená velikost písma
    var fontSize: FontSize {
        switch self {
        case .titlePrimary: return .title
        case .subtitleSecondary: return .subtitle
        case .bodyPrimary, .boldDanger: return .body
        case .bannerOverlay: return .subtitle
        case .smallTitle: return .body
        }
    }

    /// Přiřazená váha písma
    var fontWeight: FontWeight {
        switch self {
        case .titlePrimary: return .semibold
        case .subtitleSecondary: return .medium
        case .bodyPrimary: return .regular
        case .boldDanger: return .bold
        case .bannerOverlay: return .medium
        case .smallTitle: return .semibold
        }
    }

    /// Přiřazená barva textu
    var textColor: TextColor {
        switch self {
        case .titlePrimary, .bodyPrimary, .smallTitle: return .primary
        case .subtitleSecondary: return .secondary
        case .boldDanger: return .danger
        case .bannerOverlay: return .primary
        }
    }
}

/// Modifikátor aplikující styl na textové prvky
struct TextStyling: ViewModifier {
    /// Zvolený styl textu
    let style: TextStyle

    func body(content: Content) -> some View {
        content
            .font(
                .system(
                    size: style.fontSize.value,
                    weight: style.fontWeight.value,
                    design: .default,
                    relativeTo: style.fontSize.textStyle
                )
            )
            .foregroundColor(style.textColor.value)
    }
}

extension View {
    /// Jednoduché použití modifikátoru přes View extension
    func textStyle(_ style: TextStyle) -> some View {
        self.modifier(TextStyling(style: style))
    }
}
