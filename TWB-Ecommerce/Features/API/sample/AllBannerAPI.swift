//
//  BannerAPI.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 01/10/2024.
//

/*
import Foundation
import Alamofire

struct AllBannerAPI: Endpoint {
    typealias ResponseType = BannerResponse
    var pathURL: String = "/banner"
    var headers: HTTPHeaders { [:] }
    var httpMethod: HTTPMethod = .get
    var encoding: JSONEncoding = .default
}

struct Banner: Codable {
    let id: Int
    let heading: String
    let imageKey: String
    let imageKeyForDesktop: String
    let description: String
    let buttonName: String
    let link: String  // Optional because some banners might not have a link
    var active: Bool
    let createdDate: String
    let bannerTypeEnum: String
    let portalTypeEnum: String

    func getBannerDictionary() -> [String: Any] {
        let bannerDictionary: [String: Any] = [
            "heading": heading,
            "imageKey": imageKey,
            "imageKeyForDesktop": imageKeyForDesktop,
            "description": description,
            "buttonName": buttonName,
            "link": link,
            "active": active,
            "bannerTypeEnum": bannerTypeEnum,
            "createdByUserId": "a30629db-e52a-41e5-aaee-a0014d969b30",
            "modifiedByUserId": "",
            "portalTypeEnum": portalTypeEnum
        ]
        return bannerDictionary
    }
}

struct BannerResponse: Codable {
    let banners: [Banner]
}

struct SingleBanner: Codable {
    var banner: Banner
}

*/
