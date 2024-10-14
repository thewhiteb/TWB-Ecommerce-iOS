//
//  DetailFullImageTabComponent.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 14/10/2024.
//

import SwiftUI

struct DetailFullImageTabComponent: View {
    var images: [String]
    var selectedImageIndex: Int
    @Binding var isDetailFullImageViewActive: Bool

    var body: some View {
        DetailFullImageView(images: images, selectedIndex: selectedImageIndex, onClickDismiss: {
            withAnimation {
                isDetailFullImageViewActive = false
            }
        })
    }
}

