//
//  Endpoint+Extension+Variables.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 03/10/2024.
//

import Alamofire

// MARK: - Default Variables
extension Endpoint {
    var params: [String: Any] {
        return [:]
    }

    var baseURL: String {
        return Constants.baseURL
    }

    var contentType: String {
        "application/json"
    }

    var encoding: ParameterEncoding {
        URLEncoding.queryString
    }
}
