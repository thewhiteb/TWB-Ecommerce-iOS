//
//  ShopByStyles.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 10/09/2024.
//

import SwiftUI

struct ShopByStyles: View {
    @State private var items: [ItemModel] = [
        ItemModel(imageName: "AcrylicBox", itemText: "ACRYLIC BOXES"),
        ItemModel(imageName: "Bouquets", itemText: "BOUQUETS"),
        ItemModel(imageName: "AcrylicBox", itemText: "ACRYLIC BOXES"),
        ItemModel(imageName: "Bouquets", itemText: "BOUQUETS"),
        ItemModel(imageName: "AcrylicBox", itemText: "ACRYLIC BOXES")
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing : 15) {
                ForEach(items) { item in
                    ShopByStyleItem(item: item)
                }
            }
            .padding()
        }
        
    }
}
#Preview {
    ShopByStyles()
}
