//
//  OTPVerifyAPI.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 15/10/2024.
//

import Foundation

import Alamofire

struct OTPVerifyAPI: Endpoint {
    typealias ResponseType = MainResponse<OTPVerifyResponse>
    
    var pathURL: String = "/otp-code/verify"
    var headers: HTTPHeaders = [:]
    var httpMethod: HTTPMethod = .post
    var encoding: ParameterEncoding = URLEncoding.queryString
    var params: [String: Any]
    
    init(request: OTPVerifyRequest) {
        self.params = [
            "phoneNumber": request.phoneNumber,
            "email": request.email ?? "",
            "otp": request.otp,
            "otpTypeEnum": request.otpTypeEnum,
            "sendOtpViaEnum": request.sendOtpViaEnum
        ]
    }
}
