//
//  NewArivalAPI.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 07/10/2024.
//

import Foundation
import Alamofire

struct NewArivalAPI: Endpoint {
    typealias ResponseType = MainResponse<[MainItem]>

    var pathURL: String = "/mainitem/new-arrival"
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .get
    var encoding: JSONEncoding = .default
}

// MARK: - MainItem
struct MainItem: Codable, Hashable, Identifiable {
    let id: Int?
    let name: String?
    let price: Double?
    let vat: Double?
    let totalPrice: Double?
    let newArrival: Bool?
    let bestSeller: Bool?
    let soldOut: Bool?
    let itemOnSale: Bool?
    let mainItemSaleDetails: SaleDetails?
    let popularItem: Bool?
    let discountPercent: Int?
    let fixedPriceDiscount: Int?
    let createdByUser: String?
    let modifiedByUser: String?
    let createdDate: String?
    let mainItemCategoriesLink: String?
    let mainItemSubItemLink: String?
    let mainItemImages: [MainItemImage]?
    let mainItemSubCategoriesLink: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case vat
        case totalPrice
        case newArrival
        case bestSeller
        case soldOut
        case itemOnSale
        case mainItemSaleDetails = "mainItem_SaleDetails"
        case popularItem
        case discountPercent
        case fixedPriceDiscount
        case createdByUser
        case modifiedByUser
        case createdDate
        case mainItemCategoriesLink = "mainItem_Categories_Link"
        case mainItemSubItemLink = "mainItem_SubItem_Link"
        case mainItemImages = "mainItem_Images"
        case mainItemSubCategoriesLink = "mainItem_SubCategories_Link"
    }
}

// MARK: - MainItemImage
struct MainItemImage: Codable, Hashable {
    let id: Int?
    let mainItemId: Int?
    let imageKey: String?

    enum CodingKeys: String, CodingKey {
        case id
        case mainItemId = "mainItemId"
        case imageKey
    }
}

// MARK: - SaleDetails
struct SaleDetails: Codable, Hashable {
    let discountByPercent: Int?
    let fixedPrice: Int?
    let salePrice: Double?
    let saleVat: Double?
    let totalSalePrice: Double?
}
