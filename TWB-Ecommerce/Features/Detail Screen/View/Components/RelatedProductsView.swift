//
//  RelatedProductsView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 04/10/2024.
//

import SwiftUI

struct RelatedProductsView: View {
    var animation : Namespace.ID
    
    
    // Sample list of items
    @State private var items: [TrendingProduct2] = [
        TrendingProduct2(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true),
        TrendingProduct2(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Round Bouquet", itemPrice: "AED 250", isCustomizable: true),
        TrendingProduct2(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Elegant Roses", itemPrice: "AED 180", isCustomizable: false),
        TrendingProduct2(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Luxury Tulips", itemPrice: "AED 500", isCustomizable: false),
        TrendingProduct2(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Classic Red Roses", itemPrice: "AED 300", isCustomizable: true),
        TrendingProduct2(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Classic Red Roses", itemPrice: "AED 300", isCustomizable: true),
    ]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {  // Add spacing for items
                    ForEach(items) { item in
                        ListingItemView(
                            listItem: globalListingScreenItem,
                            animation : animation
                        )
                        .frame(width: 190, height: 270)  // Set a fixed width for each item to ensure proper scrolling
                    }
                }
                .padding(.horizontal)  // Add padding to scroll view
            }
        }
    }
}

//#Preview {
//    RelatedProductsView()
//}

