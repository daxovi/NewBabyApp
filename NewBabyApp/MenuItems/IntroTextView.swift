//
//  IntroTextView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 02.07.2025.
//

import SwiftUI

struct IntroTextView: View {
    let model: IntroTextModel
    @State private var isCollapsed = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(model.title)
                    .textStyle(.smallTitle)
                Spacer()
                if model.isCollapsable {
                    Image(systemName: "chevron.right")
                        .rotationEffect(Angle(degrees: isCollapsed ? 0 : 90))
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    if model.isCollapsable {
                        isCollapsed.toggle()
                    }
                }
            }
            if !model.isCollapsable || !isCollapsed {
                Divider()
                let content = model.content
                let textArray = content.splitToParagraphs()
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(textArray, id: \.self) { paragraph in
                        Text(paragraph)
                            .textStyle(.bodyPrimary)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .padding(.vertical, 10)
    }
}

//#Preview {
//    VStack {
//        Spacer()
//        IntroTextView(model: IntroTextModel(title: "Úvodní text", content: "Toto je obsah úvodního textu, který může být delší a obsahovat více informací.", isCollapsable: true))
//        Spacer()
//    }
//    .padding()
//    .background(Color.background)
//}
