//
//  PerfumeAPI.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 02/10/2024.
//

import Alamofire

struct PerfumeAPI: Endpoint {
    typealias ResponseType = Response

    var pathURL: String { "/banner" }
    var headers: HTTPHeaders { getDefaultHeaders() }
    var httpMethod: HTTPMethod { .post }
    var encoding: ParameterEncoding = JSONEncoding.prettyPrinted
    var params: [String : Any]
}

struct Result: Codable {
    let id: Int
    let heading: String
    let imageKey: String
    let imageKeyForDesktop: String
    let description: String
    let buttonName: String
    let link: String?  // Optional because link can be empty
    let active: Bool
    let createdDate: String
    let bannerTypeEnum: String
    let portalTypeEnum: String
}

struct Response: Codable {
    let result: Result
}

