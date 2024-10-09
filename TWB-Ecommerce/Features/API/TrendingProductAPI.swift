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

// MARK: - Product
struct TrendingProduct: Codable {
    let id: Int
    let name: String
    let price: Double
    let vat: Double
    let totalPrice: Double
    let newArrival: Bool
    let bestSeller: Bool
    let soldOut: Bool
    let itemOnSale: Bool
    let mainItemSaleDetails: SaleDetails?
    let popularItem: Bool
    let discountPercent: Int
    let fixedPriceDiscount: Int
    let createdByUser: String
    let modifiedByUser: String
    let createdDate: String
    let mainItemCategoriesLink: String?
    let mainItemSubItemLink: String?
    let mainItemImages: [MainItemImage]
    let mainItemSubCategoriesLink: String?

    enum CodingKeys: String, CodingKey {
        case id, name, price, vat, totalPrice, newArrival, bestSeller, soldOut, itemOnSale
        case mainItemSaleDetails = "mainItem_SaleDetails"
        case popularItem, discountPercent, fixedPriceDiscount, createdByUser, modifiedByUser, createdDate
        case mainItemCategoriesLink = "mainItem_Categories_Link"
        case mainItemSubItemLink = "mainItem_SubItem_Link"
        case mainItemImages = "mainItem_Images"
        case mainItemSubCategoriesLink = "mainItem_SubCategories_Link"
    }
}
