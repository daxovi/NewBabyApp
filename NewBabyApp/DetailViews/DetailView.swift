//
//  DetailView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 14.10.2024.
//

import SwiftUI

struct DetailView: View {
    // na vstupu přijme data z DetailModel
    var detail: DetailModel
    
    var body: some View {
        Text("\(detail.title)")
    }
}

/*
#Preview {
    DetailView()
}
*/
