//
//  ItemModel.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 10/09/2024.
//

import SwiftUI

// Define a model class with two properties: imageName and itemText
struct ItemModel: Identifiable, Equatable {
    let id = UUID() // Unique identifier for each item
    let imageName: String
    let itemText: String
    var previousOffset: CGFloat = 0 // Add previousOffset to store the calculated offset
}

