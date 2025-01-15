//
//  PrvniDenView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 13.01.2025.
//

import SwiftUI

struct KanavitTextView: View {
    
    var body: some View {
        ScrollView {
            Image("kanavit")
                .resizable()
                .scaledToFit()
            Text(
            """
            **Vitamin K – Kanavit**
            Po porodu dostává miminko do pusy kapky s  vitaminem K (Kanavit). Jedná se o vitamin, který zabraňuje rozvoji krvácivé nemoci novorozence. Tato nemoc vzniká právě z nedostatku vitaminu K.

            """
            )
                .padding()
        }
    }
}

#Preview {
    KanavitTextView()
}
