//
//  DoubleMenuItemView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 02.07.2025.
//

import SwiftUI

struct DoubleMenuItemView: View {
    let item: [NavigationDestination]
    
    var body: some View {
            HStack(spacing: 20) {
                ForEach(item.indices, id: \.self) { index in
                    MenuItemView(menuItem: item[index])
                }
        }
    }
}
