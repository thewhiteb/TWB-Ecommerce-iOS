//
//  BannerAPI.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 01/10/2024.
//

import Foundation
import Alamofire

struct BannerAPI: Endpoint {
    typealias ResponseType = BannerResponse
    var pathURL: String = "/banner"
    var headers: HTTPHeaders { getDefaultHeaders() }
    var httpMethod: HTTPMethod = .get
    var baseURL: String = "https://dev-thewhitebtq-be.twb.ae"
    var encoding: ParameterEncoding = URLEncoding.default
}

struct Banner: Codable {
    let id: Int
    let heading: String
    let imageKey: String
    let imageKeyForDesktop: String
    let description: String
    let buttonName: String
    let link: String?  // Optional because some banners might not have a link
    let active: Bool
    let createdDate: String
    let bannerTypeEnum: String
    let portalTypeEnum: String
}

struct BannerResponse: Codable {
    let banners: [Banner]
}
