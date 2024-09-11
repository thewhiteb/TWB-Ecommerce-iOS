//
//  NewArrivals.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 11/09/2024.
//

import SwiftUI

struct NewArrivals: View {
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150),spacing: 10)
    ]
    
    // Sample list of items
    @State private var items: [TrendingProduct] = [
        TrendingProduct(images: ["Bouquets"], itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true),
        TrendingProduct(images: ["Bouquets"], itemName: "Round Bouquet", itemPrice: "AED 250", isCustomizable: true),
        TrendingProduct(images: ["Bouquets"], itemName: "Elegant Roses", itemPrice: "AED 180", isCustomizable: false),
        TrendingProduct(images: ["Bouquets"], itemName: "Luxury Tulips", itemPrice: "AED 500", isCustomizable: false)
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: adaptiveColumn, spacing: 15) {
                ForEach(items, id: \.self) { item in
                    NewArrivalItem(
                        images: item.images,
                        itemName: item.itemName,
                        itemPrice: item.itemPrice,
                        isCustomizable: item.isCustomizable
                    )
                }
            }
            
        }
    }
}

#Preview {
    NewArrivals()
}
