//
//  TopCrouselAPI.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 11/10/2024.
//

import Foundation
import Alamofire

struct TopCrouselAPI: Endpoint {
    typealias ResponseType = MainResponse<[Banner]>

    var pathURL: String = "/banner/Announcement/banners"
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .get
    var encoding: JSONEncoding = .default
}

struct Banner: Codable {
    let id: Int?
    let heading: String?
    let imageKey: String?
    let imageKeyForDesktop: String?
    let description: String?
    let buttonName: String?
    let link: String?
    let active: Bool?
    let createdDate: String?
    let bannerTypeEnum: String?
    let portalTypeEnum: String?
}
