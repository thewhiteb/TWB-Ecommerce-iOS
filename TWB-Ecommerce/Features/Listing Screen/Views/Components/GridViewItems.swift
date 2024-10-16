//
//  GridViewItems.swift
//  TWB-Ecommerce
//
/////  Created by Khurram Ansar on 20/09/2024.
//

import SwiftUI

struct GridViewItems: View {
    
    var animation  : Namespace.ID
    var items: [ListingScreenItem]
    
    // Define the grid layout: 2 columns with flexible widths
    private let gridItems = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    // Closure to handle item click
    var onItemClick: (ListingScreenItem) -> Void
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 15) {
            ForEach(0..<items.count) { index in
                ListingItemView(
                    listItem: items[index],
                    animation: animation
                )
               
                .onTapGesture {
                    onItemClick(items[index])  // Trigger the item click closure
                }
            }
        }
        .padding(.horizontal, 15)
    }
}



