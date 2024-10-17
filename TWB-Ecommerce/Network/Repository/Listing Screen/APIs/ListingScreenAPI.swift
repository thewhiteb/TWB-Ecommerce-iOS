//
//  ListingScreenAPI.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 16/10/2024.
//

import Alamofire

enum SortingOrder: String, Codable {
    case trending = "Popular"
    case newest = "NewItems"
    case lowestPrice = "PriceAsc"
    case highestPrice = "PriceDesc"
    case topSeller = "TopSeller"
}

struct ListingScreenAPI: Endpoint {
    typealias ResponseType = MainResponse<[ListingScreenItem]>

    var pathURL: String = "/mainitem/filtered"
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .get
    var params: [String : Any] {
        [
            "sortOrderEnum":"\(sortOrderEnum.rawValue)",
            "pageNumber": "\(pageNumber)",
            "pageSize": "\(pageSize)",
            "mainItem_Category":"\(mainItemCategory)"
        ]
    }
    var pageNumber: Int
    var pageSize: Int
    var mainItemCategory: String
    var sortOrderEnum: SortingOrder
}



struct ListingScreenItem: Codable {
    let id: Int?
    let name: String?
    let price: Double?
    let vat: Double?
    let totalPrice: Double?
    let newArrival, bestSeller, soldOut, itemOnSale: Bool?
    let mainItemSaleDetails: SaleDetails?
    let popularItem: Bool?
    let discountPercent: Int?
    let fixedPriceDiscount: Int?
    let createdByUser, modifiedByUser, createdDate: String?
    let mainItemCategoriesLink: [MainItemCategoryLink]?
    let mainItemSubItemLink: [MainItemSubItemLink]?
    let mainItemImages: [MainItemImage]?
    let mainItemSubCategoriesLink: [MainItemSubCategoryLink]?
    
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
    let mainItemCategoryId: Int?
    let mainItemCategoryName: String?
    let mainItemCategoryTagId: Int?
    
    enum CodingKeys: String, CodingKey {
        case mainItemCategoryId = "mainItem_CategoryId"
        case mainItemCategoryName = "mainItem_CategoryName"
        case mainItemCategoryTagId = "mainItem_CategoryTagId"
    }
}

struct MainItemSubItemLink: Codable {
    let id: Int?
    let name: String?
    let subItemCategoryId, subItemSubCategoryId: Int?
    let sku: String?
    let subItemColorsList: [SubItemColor]?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case subItemCategoryId = "subItemCategoryId"
        case subItemSubCategoryId = "subItemSubCategoryId"
        case sku
        case subItemColorsList = "subItemColorsList"
    }
}

struct SubItemColor: Codable {
    let colorId: Int?
    let colorName, colorCode: String?

    enum CodingKeys: String, CodingKey {
        case colorId
        case colorName
        case colorCode
    }
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


let globalListingScreenItem: ListingScreenItem = .init(
    id: 444,
    name: "Rectangular Acrylic 061",
    price: 347.62,
    vat: 17.38,
    totalPrice: 365,
    newArrival: false,
    bestSeller: false,
    soldOut: false,
    itemOnSale: false,
    mainItemSaleDetails: nil,
    popularItem: true,
    discountPercent: 0,
    fixedPriceDiscount: 0,
    createdByUser: "Rose",
    modifiedByUser: "PopularUpdaterScheduler",
    createdDate: "2024-02-10T11:34:31.9811913",
    mainItemCategoriesLink: [
        MainItemCategoryLink(mainItemCategoryId: 7, mainItemCategoryName: "Brown", mainItemCategoryTagId: 4),
        MainItemCategoryLink(mainItemCategoryId: 11, mainItemCategoryName: "Happy Birthday", mainItemCategoryTagId: 2),
        MainItemCategoryLink(mainItemCategoryId: 13, mainItemCategoryName: "Best Wishes", mainItemCategoryTagId: 2),
        MainItemCategoryLink(mainItemCategoryId: 55, mainItemCategoryName: "Thank You", mainItemCategoryTagId: 2),
        MainItemCategoryLink(mainItemCategoryId: 58, mainItemCategoryName: "Congratulations", mainItemCategoryTagId: 2),
        MainItemCategoryLink(mainItemCategoryId: 60, mainItemCategoryName: "Acrylic Boxes", mainItemCategoryTagId: 1),
        MainItemCategoryLink(mainItemCategoryId: 62, mainItemCategoryName: "Welcome Back", mainItemCategoryTagId: 2)
    ],
    mainItemSubItemLink: [
        MainItemSubItemLink(id: 47, name: "Rectangular Acrylic 48x16x22 CM", subItemCategoryId: 3, subItemSubCategoryId: 8, sku: nil, subItemColorsList: []),
        MainItemSubItemLink(id: 52, name: "TWB Ribbon per 2 Meters", subItemCategoryId: 3, subItemSubCategoryId: 11, sku: nil, subItemColorsList: []),
        MainItemSubItemLink(id: 96, name: "Marble Chocolate Cake", subItemCategoryId: 2, subItemSubCategoryId: 5, sku: nil, subItemColorsList: []),
        MainItemSubItemLink(id: 48, name: "Small Topper", subItemCategoryId: 4, subItemSubCategoryId: 20, sku: nil, subItemColorsList: []),
        MainItemSubItemLink(id: 462, name: "Tulip", subItemCategoryId: 1, subItemSubCategoryId: 40, sku: nil, subItemColorsList: []),
        MainItemSubItemLink(id: 363, name: "Eucalyptus Cinerea", subItemCategoryId: 1, subItemSubCategoryId: 4, sku: nil, subItemColorsList: []),
        MainItemSubItemLink(id: 460, name: "Tanacetum", subItemCategoryId: 1, subItemSubCategoryId: 40, sku: nil, subItemColorsList: [])
    ],
    mainItemImages: [
        MainItemImage(id: 2788, mainItemId: 444, imageKey: "Rectangular Acrylic 061 1080x1350_2024-10-02 1.09.46 PM.jpg"),
        MainItemImage(id: 2789, mainItemId: 444, imageKey: "Rectangular Acrylic 061 a_2024-08-22 3.59.43 PM_2024-10-02 1.09.46 PM.jpg"),
        MainItemImage(id: 2790, mainItemId: 444, imageKey: "Rectangular Acrylic 0610_2024-08-22 3.59.42 PM_2024-10-02 1.09.46 PM.jpg"),
        MainItemImage(id: 2791, mainItemId: 444, imageKey: "Rectangular Acrylic 0611_2024-08-22 3.59.44 PM_2024-10-02 1.09.46 PM.jpg")
    ],
    mainItemSubCategoriesLink: [
        MainItemSubCategoryLink(mainItemSubCategoryId: 3, mainItemSubCategoryName: "Rectangle Acrylic", mainItemCategoryId: 60)
    ]
)
