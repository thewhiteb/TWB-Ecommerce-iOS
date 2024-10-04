//
//  Endpoint+Extension+Headers.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 03/10/2024.
//

import Alamofire

// MARK: - Headers Extension
extension Endpoint {
    func getDefaultHeaders() -> HTTPHeaders {
        return [
            Constants.HeadersKeys.appVersion: Device.versionBuildNumber,
            Constants.HeadersKeys.osVersion: Device.osVersion,
            Constants.HeadersKeys.deviceModel: Device.deviceModel
        ]
    }

    func getHeaders() -> HTTPHeaders {
        var headers = getDefaultHeaders()
        for (key, value) in self.headers.dictionary {
            headers[key] = value
        }
        headers[Constants.HeadersKeys.contentType] = self.contentType
        return headers
    }
}
