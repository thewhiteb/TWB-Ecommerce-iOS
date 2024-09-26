//
//  ShopByStyles.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 10/09/2024.
//

import SwiftUI

struct ShopByStyles: View {
    @State private var items: [ItemModel] = [
        ItemModel(imageName: "AcrylicBox", itemText: "Acrylic Boxes"),
        ItemModel(imageName: "Bouquets", itemText: "Bouquets"),
        ItemModel(imageName: "AcrylicBox", itemText: "Acrylic Boxes"),
        ItemModel(imageName: "Bouquets", itemText: "Bouquets"),
        ItemModel(imageName: "AcrylicBox", itemText: "Bouquets")
    ]
    
    var onItemSelected: (String) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing : 15) {
                ForEach(items) { item in
                    ShopByStyleItem(item: item)
                        .onTapGesture {
                            onItemSelected(item.itemText) // Trigger the closure with the selected item text
                        }
                }
            }
            .padding()
        }
        
    }
}
#Preview {
    ShopByStyles { selectedItem in
            print("Selected Item: \(selectedItem)") 
        }
}
