//
//  TrendingProductAPI.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 09/10/2024.
//

import Foundation
import Alamofire

struct TrendingProductAPI: Endpoint {
    typealias ResponseType = MainResponse<[TrendingProduct]>

    var pathURL: String = "/mainitem/popular-items"
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .get
    var encoding: JSONEncoding = .default
}

struct TrendingProduct: Codable, Identifiable {
    let id: Int?
    let name: String?
    let price: Double?
    let vat: Double?
    let totalPrice: Double?
    let soldOut: Bool?
    let itemOnSale: Bool?
    let mainItemSaleDetails: String?
    let popularItem: Bool?
    let discountPercent: Int?
    let fixedPriceDiscount: Int?
    let mainItemImages: [MainItemImage]?
    
    enum CodingKeys: String, CodingKey {
        case id, name, price, vat, totalPrice, soldOut, itemOnSale, popularItem, discountPercent, fixedPriceDiscount
        case mainItemSaleDetails = "mainItem_SaleDetails"
        case mainItemImages = "mainItem_Images"
    }
}
