//
//  MainItemCategories.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 04/10/2024.
//

import Foundation

// MARK: - MainItemCategories
struct MainItemCategories: Codable {
    let data: [CategoryItem]?
    let statusCode: Int
    let messages: [String]
}

// MARK: - CategoryItem
struct CategoryItem: Codable {
    let id: Int
    let name: String
    let mainItemCategoryTagId: Int
    let mainItemCategoryTagName: String
    let storyImageKey: String
    let primaryImageKey: String
    let bannerImageKey: String
    let mobileBannerImageKey: String
    let createdByUser: String
    let modifiedByUser: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case mainItemCategoryTagId = "mainItem_CategoryTagId"
        case mainItemCategoryTagName = "mainItem_CategoryTagName"
        case storyImageKey, primaryImageKey, bannerImageKey, mobileBannerImageKey, createdByUser, modifiedByUser
    }
}
