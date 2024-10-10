//
//  TrendingProduct.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 11/09/2024.
//

import SwiftUI

struct TrendingProduct2 : Identifiable {
    var id  = UUID().uuidString
    let images: [String]
    let itemName: String
    let itemPrice: String
    let isCustomizable: Bool
}
