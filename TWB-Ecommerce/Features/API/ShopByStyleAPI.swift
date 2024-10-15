//
//  ShopByStyleAPI.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 09/10/2024.
//

import Foundation
import Alamofire

struct ShopByStyleAPI: Endpoint {
    typealias ResponseType = MainResponse<[ProductItem]>

    var pathURL: String = "/mainitem/1/categories"
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .get
    var encoding: ParameterEncoding = JSONEncoding.default
}


struct ProductItem: Codable, Identifiable, Hashable {
    let id: Int?
    let name: String?
    let mainItemCategoryTagId: Int?
    let mainItemCategoryTagName: String?
    let storyImageKey: String?
    let primaryImageKey: String?
    let bannerImageKey: String?
    let mobileBannerImageKey: String?
    let createdByUser: String?
    let modifiedByUser: String?
    var previousOffset: CGFloat = 0 // Add previousOffset to store the calculated offset

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case mainItemCategoryTagId = "mainItem_CategoryTagId"
        case mainItemCategoryTagName = "mainItem_CategoryTagName"
        case storyImageKey
        case primaryImageKey
        case bannerImageKey
        case mobileBannerImageKey
        case createdByUser
        case modifiedByUser
    }
}
