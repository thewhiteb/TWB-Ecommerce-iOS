//
//  OTPGenerateAPI.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 14/10/2024.
//

import Foundation

import Alamofire

struct OTPGenerateAPI: Endpoint {
    typealias ResponseType = MainResponse<[LoginResponse]>
    
    var pathURL: String = "/otp-code/generate"
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .post
    var encoding: JSONEncoding = .prettyPrinted
    var params: [String: Any]
    
    init(request: LoginRequest) {
        self.params = [
            "name": request.name ?? "",
            "phoneNumber": request.phoneNumber,
            "email": request.email ?? "",
            "otpTypeEnum": request.otpTypeEnum,
            "userTypeEnum": request.userTypeEnum,
            "sendOtpViaEnum": request.sendOtpViaEnum
        ]
    }
}
