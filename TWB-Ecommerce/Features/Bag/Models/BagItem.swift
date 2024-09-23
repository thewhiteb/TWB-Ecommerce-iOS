//
//  BagItem.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 19/09/2024.
//

import Foundation

struct BagViewItemModel: Equatable, Hashable, Identifiable {
    let id: String
    let price: Int
    var count: Int = 1
    let letters: String?
    let flavour: String?
    let topper: String
    let customisedTopper: Bool
    let vat: Int // Question: is it for a single product or for all product. Like count is 2, then for 2 or for 1
    let imageURL: String
    var totalPrice: Int {
        (count * price) + vat
    }
}

let items: [BagViewItemModel] = [.init(id: "Tube Acrylic 018",
                                       price: 447,
                                       count: 1,
                                       letters: "A",
                                       flavour: "Vanilla Mistikkah",
                                       topper: "Congratulations (AED 32)",
                                       customisedTopper: false,
                                       vat: 10,
                                       imageURL: ""),
                                 .init(id: "Long Acrylic Tray 006",
                                       price: 1053,
                                       count: 2,
                                       letters: "A",
                                       flavour: "Vanilla Mistikkah",
                                       topper: "Congratulations (AED 32)",
                                       customisedTopper: true,
                                       vat: 10,
                                       imageURL: ""),
                                 .init(id: "Tube Acrylic 018",
                                       price: 447,
                                       count: 1,
                                       letters: "A",
                                       flavour: "Vanilla Mistikkah",
                                       topper: "Congratulations (AED 32)",
                                       customisedTopper: false,
                                       vat: 10,
                                       imageURL: ""),
                                 .init(id: "Long Acrylic Tray 006",
                                       price: 1053,
                                       count: 2,
                                       letters: "A",
                                       flavour: "Vanilla Mistikkah",
                                       topper: "Congratulations (AED 32)",
                                       customisedTopper: true,
                                       vat: 10,
                                       imageURL: "")]
