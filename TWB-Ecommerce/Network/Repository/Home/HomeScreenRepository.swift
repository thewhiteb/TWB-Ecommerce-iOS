//
//  HomeScreenRepository.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 15/10/2024.
//

import Foundation

protocol HomeRepository {
    func getNewArrivalsItems() async -> MainResponse<[MainItem]>
    func getGiftByOccasionItems() async -> MainResponse<[ProductItem]>
    func getShopByStyleItems() async -> MainResponse<[ProductItem]>
    func getTrendingProductItems() async -> MainResponse<[TrendingProduct]>
    func getTopCrouselBanners() async -> MainResponse<[Banner]>
    func getSecondCrouselBanners() async -> MainResponse<[Banner]>
}


struct HomeRepositoryImplementation: HomeRepository {

    func getNewArrivalsItems() async -> MainResponse<[MainItem]> {
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

    func getGiftByOccasionItems() async -> MainResponse<[ProductItem]> {
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

    func getShopByStyleItems() async -> MainResponse<[ProductItem]> {
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

    func getTrendingProductItems() async -> MainResponse<[TrendingProduct]> {
        do {
            let response = try await TrendingProductAPI().call()
            return response
        } catch let error {
            // There are two cases for the error:
            // 1. Parsing failed
            // 2. Alamofire error
            let response = MainResponse<[TrendingProduct]>(data: nil,
                                                           messages: ["Server is not working!"],
                                                           statusCode: (error as NSError).code)
            return response
        }
    }

    func getTopCrouselBanners() async -> MainResponse<[Banner]> {
        do {
            let response = try await TopCrouselAPI().call()
            return response
        } catch let error {
            // There are two cases for the error:
            // 1. Parsing failed
            // 2. Alamofire error
            let response = MainResponse<[Banner]>(data: nil,
                                                  messages: ["Server is not working!"],
                                                  statusCode: (error as NSError).code)
            return response
        }
    }

    func getSecondCrouselBanners() async -> MainResponse<[Banner]> {
        do {
            let response = try await TopCrouselAPI().call()
            return response
        } catch let error {
            // There are two cases for the error:
            // 1. Parsing failed
            // 2. Alamofire error
            let response = MainResponse<[Banner]>(data: nil,
                                                  messages: ["Server is not working!"],
                                                  statusCode: (error as NSError).code)
            return response
        }
    }
}
