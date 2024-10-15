//
//  GiftByOccasionAPI.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 08/10/2024.
//

import Foundation
import Alamofire

struct GiftByOccasionAPI: Endpoint {
    typealias ResponseType = MainResponse<[ProductItem]>
    var pathURL: String = "/mainitem/1/categories"
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .get
    var encoding: ParameterEncoding = JSONEncoding.default
}
