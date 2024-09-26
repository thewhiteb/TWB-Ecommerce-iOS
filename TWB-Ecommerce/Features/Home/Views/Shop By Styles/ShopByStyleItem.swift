//
//  ShopByStyleItem.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 11/09/2024.
//

import SwiftUI

struct ShopByStyleItem: View {
    var item: ItemModel
    
    var body: some View {
        VStack(alignment: .center,spacing: 0) {
            Text(item.itemText)
                .font(Font.custom("Baskerville", size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top,20)
            Spacer()
            Image(item.imageName)
                .resizable() // Make image resizable
                .scaledToFit() // Ensure the image scales proportionally
                .frame(height: 180) // Set a fixed size for the image
                .padding(0)
        }
        .frame(width: 130, height: 220) // Fix the frame size of the VStack
        .padding()
        .background(Color.white)
        .shadow(color: .black.opacity(0.15), radius: 2.5, x: 1, y: 1)
    }
}

#Preview {
    ShopByStyleItem(item: ItemModel(imageName: "AcrylicBox", itemText: "ACRYLIC BOXES"))
}
