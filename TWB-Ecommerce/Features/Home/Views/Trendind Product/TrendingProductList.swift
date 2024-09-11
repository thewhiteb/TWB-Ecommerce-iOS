//
//  TrendingProductList.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 03/09/2024.
//

import SwiftUI

struct TrendingProductList: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack() {
                TrendingProductItem(  images: ["Bouquet1", "Bouquet1", "Bouquet1"],
                                      itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
                TrendingProductItem(  images: ["Bouquet1", "Bouquet1", "Bouquet1"],
                                      itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
                TrendingProductItem(  images: ["Bouquet1", "Bouquet1", "Bouquet1"],
                                      itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
                TrendingProductItem(  images: ["Bouquet1", "Bouquet1", "Bouquet1"],
                                      itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
                TrendingProductItem(  images: ["Bouquet1", "Bouquet1", "Bouquet1"],
                                      itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
                TrendingProductItem(  images: ["Bouquet1", "Bouquet1", "Bouquet1"],
                                      itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
            }
        }
    }
}

#Preview {
    TrendingProductList()
}
