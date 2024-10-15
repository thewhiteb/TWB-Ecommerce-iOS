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

let trendingProductList: [TrendingProduct] = [
    .init(
        id: 444,
        name: "Rectangular Acrylic 061",
        price: 347.62,
        vat: 17.38,
        totalPrice: 365,
        soldOut: false,
        itemOnSale: false,
        mainItemSaleDetails: nil,
        popularItem: true,
        discountPercent: 0,
        fixedPriceDiscount: 0,
        mainItemImages: [
            .init(id: 2788, mainItemId: 444, imageKey: "Rectangular Acrylic 061 1080x1350_2024-10-02 1.09.46 PM.jpg"),
            .init(id: 2789, mainItemId: 444, imageKey: "Rectangular Acrylic 061 a_2024-08-22 3.59.43 PM_2024-10-02 1.09.46 PM.jpg"),
            .init(id: 2790, mainItemId: 444, imageKey: "Rectangular Acrylic 0610_2024-08-22 3.59.42 PM_2024-10-02 1.09.46 PM.jpg"),
            .init(id: 2791, mainItemId: 444, imageKey: "Rectangular Acrylic 0611_2024-08-22 3.59.44 PM_2024-10-02 1.09.46 PM.jpg")
        ]
    ),
    .init(
        id: 332,
        name: "Bouquet Bag 008",
        price: 300,
        vat: 15,
        totalPrice: 315,
        soldOut: false,
        itemOnSale: false,
        mainItemSaleDetails: nil,
        popularItem: true,
        discountPercent: 0,
        fixedPriceDiscount: 0,
        mainItemImages: [
            .init(id: 2792, mainItemId: 332, imageKey: "Bouquet Bag 008_1080x1350_2024-10-02 1.13.11 PM.jpg"),
            .init(id: 2793, mainItemId: 332, imageKey: "Bouquet Bag 008 a_2024-09-16 3.59.31 PM_2024-10-02 1.13.11 PM.jpg"),
            .init(id: 2794, mainItemId: 332, imageKey: "Bouquet Bag 008 b_2024-09-16 3.59.31 PM_2024-10-02 1.13.11 PM.jpg"),
            .init(id: 2795, mainItemId: 332, imageKey: "Bouquet Bag 008 c_2024-09-16 3.59.32 PM_2024-10-02 1.13.11 PM.jpg")
        ]
    ),
    .init(
        id: 130,
        name: "Single Acrylic 007",
        price: 219.05,
        vat: 10.95,
        totalPrice: 230,
        soldOut: false,
        itemOnSale: false,
        mainItemSaleDetails: nil,
        popularItem: true,
        discountPercent: 0,
        fixedPriceDiscount: 0,
        mainItemImages: [
            .init(id: 2800, mainItemId: 130, imageKey: "Single Acrylic 007_1080x1350_2024-10-02 1.21.00 PM.jpg"),
            .init(id: 2801, mainItemId: 130, imageKey: "Single Acrylic 007-08272024-4_2024-08-27 11.02.37 AM_2024-10-02 1.21.00 PM.jpg"),
            .init(id: 2802, mainItemId: 130, imageKey: "Single Acrylic 007 b new_2024-08-26 4.59.59 PM_2024-08-27 11.02.41 AM_2024-10-02 1.21.01 PM.jpg"),
            .init(id: 2803, mainItemId: 130, imageKey: "Single Acrylic 007 c new-_2024-08-29 3.10.22 PM_2024-10-02 1.21.01 PM.jpg")
        ]
    ),
    .init(
        id: 128,
        name: "Single Acrylic 001",
        price: 195.24,
        vat: 9.76,
        totalPrice: 205,
        soldOut: false,
        itemOnSale: false,
        mainItemSaleDetails: nil,
        popularItem: true,
        discountPercent: 0,
        fixedPriceDiscount: 0,
        mainItemImages: [
            .init(id: 2796, mainItemId: 128, imageKey: "Single Acrylic 001_1080x1350_2024-10-02 1.17.37 PM.jpg"),
            .init(id: 2797, mainItemId: 128, imageKey: "Single Acrylic 001 a_2024-08-30 10.14.58 AM_2024-10-02 1.17.37 PM.jpg"),
            .init(id: 2798, mainItemId: 128, imageKey: "Single Acrylic 001 b_2024-08-30 10.14.59 AM_2024-10-02 1.17.37 PM.jpg"),
            .init(id: 2799, mainItemId: 128, imageKey: "Single Acrylic 001 c_2024-08-30 10.14.59 AM_2024-10-02 1.17.37 PM.jpg")
        ]
    )
]
3
