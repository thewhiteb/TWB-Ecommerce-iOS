//
//  ListingScreenRepository.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 15/10/2024.
//

import Foundation

protocol ListingScreenRepository {
    func getAllListingsItems(for item: String,
                             pageSize: Int,
                             pageNumber: Int,
                             sortOrder: SortingOrder) async -> MainResponse<[ListingScreenItem]>
}

struct ListingScreenRepositoryImplementation: ListingScreenRepository {

    func getAllListingsItems(for item: String,
                             pageSize: Int,
                             pageNumber: Int,
                             sortOrder: SortingOrder) async -> MainResponse<[ListingScreenItem]> {
        do {
            let response = try await ListingScreenAPI(pageNumber: pageNumber,
                                                      pageSize: pageSize,
                                                      mainItemCategory: item,
                                                      sortOrderEnum: sortOrder)
                .call()
            return response
        } catch let error {
            // There are two cases for the error:
            // 1. Parsing failed
            // 2. Alamofire error
            let response = MainResponse<[ListingScreenItem]>(data: nil,
                                                                 messages: ["Server is not working!"],
                                                                 statusCode: (error as NSError).code)
            return response
        }
    }
}


