//
//  GiftByOccasionAPI.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 08/10/2024.
//

import Foundation
import Alamofire

struct GiftByOccasionAPI: Endpoint {
    typealias ResponseType = MainResponse<[Category]>
    var pathURL: String = "/mainitem/categories"
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .get
    var encoding: JSONEncoding = .default
}

// MARK: - Category
struct Category: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let mainItemCategoryTagId: Int
    let mainItemCategoryTagName: String
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
