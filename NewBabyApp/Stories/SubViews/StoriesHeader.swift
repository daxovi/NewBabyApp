//
//  StoriesHeader.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 01.08.2025.
//

import SwiftUI

struct StoriesHeader: View {
    let text: String
    let onDismiss: () -> Void
    
    var body: some View {
        HStack(alignment: .top) {
            Text(text)
                .textStyle(.bodyPrimary)
            
            Spacer(minLength: 24)
            
            Button {
                onDismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            .containerShape(Rectangle())
        }
    }
}

#Preview {
    VStack{
        StoriesHeader(text: "Quisque imperdiet diam ut pretium pellentesque. Duis accumsan nec ipsum in varius. Etiam et eleifend elit. Nulla ut dignissim lorem.", onDismiss: {})
            .padding()
        UnevenRoundedRectangle(topLeadingRadius: 30, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 30, style: .circular)
            .ignoresSafeArea()
    }
}
