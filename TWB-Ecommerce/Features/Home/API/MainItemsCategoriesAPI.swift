//
//  MainItemsCategories.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 04/10/2024.
//

import Foundation
import Alamofire

// GET request
struct MainItemsCategoriesAPI: Endpoint {
    typealias ResponseType = MainItemCategories
    
    var pathURL = "/mainitem/categories/v2"
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .get
    var encoding: ParameterEncoding = JSONEncoding.default
}
