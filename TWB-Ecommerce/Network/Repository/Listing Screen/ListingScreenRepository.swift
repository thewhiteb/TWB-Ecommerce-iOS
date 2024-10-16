//
//  ListingScreenRepository.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 15/10/2024.
//

import Foundation

protocol ListingScreenRepository {
    func getAllListingsItems() async -> MainResponse<[ListingScreenResponse]>
}

struct ListingScreenRepositoryImplementation: ListingScreenRepository {

    func getAllListingsItems() async -> MainResponse<[ListingScreenResponse]> {
        do {
            let response = try await ListingScreenAPI().call()
            return response
        } catch let error {
            // There are two cases for the error:
            // 1. Parsing failed
            // 2. Alamofire error
            let response = MainResponse<[ListingScreenResponse]>(data: nil,
                                                                 messages: ["Server is not working!"],
                                                                 statusCode: (error as NSError).code)
            return response
        }
    }
}


