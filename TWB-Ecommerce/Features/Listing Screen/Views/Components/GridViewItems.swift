//
//  GridViewItems.swift
//  TWB-Ecommerce
//
/////  Created by Khurram Ansar on 20/09/2024.
//

import SwiftUI

struct GridViewItems: View {
    // Define the grid layout: 2 columns with flexible widths
    private let gridItems = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    // Sample list of items
    @State private var items: [TrendingProduct] = [
        TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true),
        TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Round Bouquet", itemPrice: "AED 250", isCustomizable: true),
        TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Elegant Roses", itemPrice: "AED 180", isCustomizable: false),
        TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Luxury Tulips", itemPrice: "AED 500", isCustomizable: false),
        TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Classic Red Roses", itemPrice: "AED 300", isCustomizable: true),
         TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Sunflower Delight", itemPrice: "AED 275", isCustomizable: false),
         TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Tulip Charm", itemPrice: "AED 320", isCustomizable: false),
         TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Mixed Roses", itemPrice: "AED 350", isCustomizable: true),
         TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Lavender Dreams", itemPrice: "AED 290", isCustomizable: true),
         TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Pink Peonies", itemPrice: "AED 450", isCustomizable: true),
         TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Orchid Splendor", itemPrice: "AED 400", isCustomizable: false),
    ]
    
    // Closure to handle item click
    var onItemClick: (TrendingProduct) -> Void
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 15) {
            ForEach(items, id: \.self) { item in
                ListingItemView(
                    images: item.images,
                    itemName: item.itemName,
                    itemPrice: item.itemPrice,
                    isCustomizable: item.isCustomizable
                )
                .onTapGesture {
                    onItemClick(item)  // Trigger the item click closure
                }
            }
        }
        .padding(.horizontal, 15)
    }
}



