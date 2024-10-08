//
//  MainResponseModel.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 07/10/2024.
//

import Foundation

struct MainResponse<T: Codable>: Codable {
    var data: T?
    var messages: [String]
    var statusCode: Int
}
