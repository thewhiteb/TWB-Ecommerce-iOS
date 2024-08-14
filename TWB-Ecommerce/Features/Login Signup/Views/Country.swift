//
//  Country.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 14/08/2024.
//

import Foundation

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let code: String
    let flag: String
}
