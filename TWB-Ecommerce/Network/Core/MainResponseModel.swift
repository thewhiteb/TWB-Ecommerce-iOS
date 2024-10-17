//
//  MainResponseModel.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 07/10/2024.
//

import Foundation

struct MainResponse<T: Codable>: Codable {
    var data: T?
    var messages: [String]
    var statusCode: Int
    var error: CustomError?
}

// Custom error structure that can be Codable
// As NSError is not Decodable
struct CustomError: Codable {
    var code: Int
    var domain: String
    var userInfo: [String: String]?
    
    enum CodingKeys: String, CodingKey {
        case code
        case domain
        case userInfo
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(Int.self, forKey: .code)
        self.domain = try container.decode(String.self, forKey: .domain)
        self.userInfo = try container.decodeIfPresent([String : String].self, forKey: .userInfo)
    }

    init (code: Int, domain: String, userInfo: [String: String]?) {
        self.code = code
        self.domain = domain
        self.userInfo = userInfo
    }

    init(error: NSError) {
        self.code = error.code
        self.domain = error.domain
        self.userInfo = error.userInfo as? [String: String]
    }
}
