//
//  Repository.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 04/10/2024.
//

import Foundation

protocol Repository {
    static func getNewArrivalsItems() async -> MainResponse<[MainItem]>
    static func getGiftByOccasionItems() async -> MainResponse<[ProductItem]>
    static func getShopByStyleItems() async -> MainResponse<[ProductItem]>
}

struct RepositoryImplementation: Repository {

    static func getNewArrivalsItems() async -> MainResponse<[MainItem]> {
        do {
            let response = try await NewArivalAPI().call()
            return response
        } catch let error {
            // There are two cases for the error:
            // 1. Parsing failed
            // 2. Alamofire error
            let response = MainResponse<[MainItem]>(data: nil,
                                             messages: ["Server is not working!"],
                                             statusCode: (error as NSError).code)
            return response
        }
    }

    static func getGiftByOccasionItems() async -> MainResponse<[ProductItem]> {
        do {
            let response = try await GiftByOccasionAPI().call()
            return response
        } catch let error {
            // There are two cases for the error:
            // 1. Parsing failed
            // 2. Alamofire error
            let response = MainResponse<[ProductItem]>(data: nil,
                                             messages: ["Server is not working!"],
                                             statusCode: (error as NSError).code)
            return response
        }
    }

    static func getShopByStyleItems() async -> MainResponse<[ProductItem]> {
        do {
            let response = try await ShopByStyleAPI().call()
            return response
        } catch let error {
            // There are two cases for the error:
            // 1. Parsing failed
            // 2. Alamofire error
            let response = MainResponse<[ProductItem]>(data: nil,
                                             messages: ["Server is not working!"],
                                             statusCode: (error as NSError).code)
            return response
        }
    }
}
