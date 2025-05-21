//
//  TextStyle.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 21.05.2025.
//
import SwiftUI

enum FontSize {
    case largeTitle
    case title
    case subtitle
    case body
    case caption

    var value: CGFloat {
        switch self {
        case .largeTitle: return 32
        case .title: return 24
        case .subtitle: return 18
        case .body: return 16
        case .caption: return 13
        }
    }
}

enum FontWeight {
    case light, regular, medium, semibold, bold

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

enum TextColor {
    case primary, secondary, danger, inverted

    var value: Color {
        switch self {
        case .primary: return .black
        case .secondary: return .gray
        case .danger: return .red
        case .inverted: return .white
        }
    }
}

enum TextStyle {
    case titlePrimary
    case subtitleSecondary
    case bodyPrimary
    case smallTitle
    case boldDanger
    case bannerOverlay

    var fontSize: FontSize {
        switch self {
        case .titlePrimary: return .title
        case .subtitleSecondary: return .subtitle
        case .bodyPrimary, .boldDanger: return .body
        case .bannerOverlay: return .subtitle
        case .smallTitle: return .body
        }
    }

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

    var textColor: TextColor {
        switch self {
        case .titlePrimary, .bodyPrimary, .smallTitle: return .primary
        case .subtitleSecondary: return .secondary
        case .boldDanger: return .danger
        case .bannerOverlay: return .primary
        }
    }
}

struct TextStyling: ViewModifier {
    let style: TextStyle

    func body(content: Content) -> some View {
        content
            .font(.system(size: style.fontSize.value, weight: style.fontWeight.value))
            .foregroundColor(style.textColor.value)
    }
}

extension View {
    func textStyle(_ style: TextStyle) -> some View {
        self.modifier(TextStyling(style: style))
    }
}
