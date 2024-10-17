//
//  OTPVerifyRequest.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 15/10/2024.
//

import Foundation

struct OTPVerifyRequest: Codable {
    let phoneNumber: String
    let email: String?
    let otp: String
    let otpTypeEnum: String
    let sendOtpViaEnum: String

}
