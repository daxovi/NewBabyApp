//
//  PrvniDenView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 13.01.2025.
//

import SwiftUI

struct TextView: View {
    var model: TextModel
    
    var body: some View {
        ScrollView {
            if let imageName = model.imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
            }
            Text(model.text)
                .padding()
        }
    }
}
