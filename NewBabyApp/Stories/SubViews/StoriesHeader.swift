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
            
            Button(action: onDismiss) {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
            }
        }
    }
}
