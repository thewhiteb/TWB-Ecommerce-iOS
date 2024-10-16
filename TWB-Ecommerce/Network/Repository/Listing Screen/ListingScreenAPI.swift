//
//  ListingScreenAPI.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 16/10/2024.
//

import Alamofire

struct ListingScreenAPI: Endpoint {
    typealias ResponseType = MainResponse<[ListingScreenResponse]>

    var pathURL: String = "/mainitem/filtered"
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .get
    var params: [String : Any] = [
        "sortOrderEnum":"TopSeller",
        "pageNumber": "1",
        "pageSize": "10"
    ]
    var encoding: ParameterEncoding = URLEncoding.queryString
}

struct ListingScreenResponse: Codable {
    let id: Int
    let name: String
    let price: Double
    let vat: Double
    let totalPrice: Double
    let newArrival: Bool
    let bestSeller: Bool
    let soldOut: Bool
    let itemOnSale: Bool
    let mainItemSaleDetails: String?
    let popularItem: Bool
    let discountPercent: Int
    let fixedPriceDiscount: Int
    let createdByUser: String
    let modifiedByUser: String
    let createdDate: String
    let mainItemCategoriesLink: [MainItemCategoryLink]
    let mainItemSubItemLink: [MainItemSubItemLink]
    let mainItemImages: [MainItemImage]
    let mainItemSubCategoriesLink: [MainItemSubCategoryLink]
    
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

struct MainItemCategoryLink: Codable {
    let mainItemCategoryId: Int
    let mainItemCategoryName: String
    let mainItemCategoryTagId: Int
    
    enum CodingKeys: String, CodingKey {
        case mainItemCategoryId = "mainItem_CategoryId"
        case mainItemCategoryName = "mainItem_CategoryName"
        case mainItemCategoryTagId = "mainItem_CategoryTagId"
    }
}

struct MainItemSubItemLink: Codable {
    let id: Int
    let name: String
    let subItemCategoryId: Int
    let subItemSubCategoryId: Int
    let sku: String?
    let subItemColorsList: [SubItemColor]
    
    enum CodingKeys: String, CodingKey {
        case id, name, sku
        case subItemCategoryId = "subItemCategoryId"
        case subItemSubCategoryId = "subItemSubCategoryId"
        case subItemColorsList = "subItemColorsList"
    }
}

struct SubItemColor: Codable {
    let colorId: Int
    let colorName: String
    let colorCode: String
}


struct MainItemSubCategoryLink: Codable {
    let mainItemSubCategoryId: Int
    let mainItemSubCategoryName: String
    let mainItemCategoryId: Int
    
    enum CodingKeys: String, CodingKey {
        case mainItemSubCategoryId = "mainItem_SubCategoryId"
        case mainItemSubCategoryName = "mainItem_SubCategoryName"
        case mainItemCategoryId = "mainItem_CategoryId"
    }
}
