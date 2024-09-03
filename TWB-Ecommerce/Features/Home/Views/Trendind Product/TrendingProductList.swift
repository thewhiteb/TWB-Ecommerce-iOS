//
//  TrendingProductList.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 03/09/2024.
//

import SwiftUI

struct TrendingProductList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 16) {
                TrendingProductItem(imageName: "Image 1", itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
                TrendingProductItem(imageName: "Image 1", itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
                TrendingProductItem(imageName: "Image 1", itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
            }
            .padding()
        }
    }
}

#Preview {
    TrendingProductList()
}
