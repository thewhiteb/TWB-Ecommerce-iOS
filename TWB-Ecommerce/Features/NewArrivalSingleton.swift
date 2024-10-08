//
//  NewArrivalSingleton.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 08/10/2024.
//

import Foundation

class NewArrivalSingleton {

    private init() {}

    static let shared = NewArrivalSingleton()

    var items: [MainItem]?
}
