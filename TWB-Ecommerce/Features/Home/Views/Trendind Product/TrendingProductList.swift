//
//  TrendingProductList.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 03/09/2024.
//

import SwiftUI

struct TrendingProductList: View {
    @State private var scrollOffset: CGFloat = 0.25  // Start progress at 25%
    @State private var maxScrollWidth: CGFloat = 0  // To store the scrollable width
    @State private var contentWidth: CGFloat = 0    // To store the total content width
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<6, id: \.self) { _ in
                        TrendingProductItem(images: ["Bouquet1", "Bouquet1", "Bouquet1"],
                                            itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
                    }
                }
                .background(
                    GeometryReader { outerGeometry in
                        Color.clear
                            .onAppear {
                                maxScrollWidth = outerGeometry.size.width
                            }
                            .onChange(of: outerGeometry.frame(in: .global).minX) { value in
                                // Update the scroll offset based on the current scroll position
                                let newOffset = -value / (maxScrollWidth - UIScreen.main.bounds.width)
                                let scaledOffset = newOffset * 0.75 + 0.25  // Scale to start at 25%
                                scrollOffset = min(max(scaledOffset, 0.25), 1)  // Clamp between 0.25 and 1
                            }
                    }
                )
            }
            
            // Custom progress bar with a very thin height
            ProgressView(value: scrollOffset, total: 1)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.black))
                .frame(height: 1)  // Use `1` for a thin, visible progress bar
                .scaleEffect(x: 1, y: 0.5, anchor: .center)  // Scale down the height
                .padding(.top, 20)
        }
    }
}

#Preview {
    TrendingProductList()
}


