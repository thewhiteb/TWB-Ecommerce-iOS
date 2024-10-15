//
//  BannerUpdateAPI.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 03/10/2024.
//

import Alamofire

struct UpdateBannerAPI: Endpoint {
    typealias ResponseType = ResultResponse
    let id: Int
    var pathURL: String { "/banner/\(id)" }
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .put
    var encoding: ParameterEncoding = JSONEncoding.prettyPrinted
    var params: [String : Any]
}

struct ResultResponse: Codable {
    let result: Banner
}
