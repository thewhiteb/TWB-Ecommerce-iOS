//
//  TopCrouselAPI 2.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 11/10/2024.
//

import Alamofire

struct SecondCrouselAPI: Endpoint {
    typealias ResponseType = MainResponse<[Banner]>

    var pathURL: String = "/banner/Featured/banners"
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .get
}
