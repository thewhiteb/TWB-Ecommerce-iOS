//
//  OnSale.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 11/09/2024.
//

import SwiftUI

struct OnSale: View {
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150),spacing: 10)
    ]
    
    // Sample list of items
    @State private var items: [TrendingProduct] = [
        TrendingProduct(images: ["Bouquet1"], itemName: "Rectangular Acrylic 061", itemPrice: "AED 365 - 30%", isCustomizable: true),
        TrendingProduct(images: ["Bouquet1"], itemName: "Round Bouquet", itemPrice: "AED 250 - 20%", isCustomizable: true)
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumn, spacing: 5) {
                ForEach(items) { item in
                    OnSaleItem(
                        images: item.images,
                        itemName: item.itemName,
                        itemPrice: item.itemPrice,
                        isCustomizable: item.isCustomizable,
                        previousPrice: "AED 320"
                    )
                }
            }
            
        }
    }
}


#Preview {
    OnSale()
}
