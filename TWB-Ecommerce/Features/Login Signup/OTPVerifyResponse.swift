//
//  OTPVerifyResponse.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 15/10/2024.
//

import Foundation

struct OTPVerifyResponse : Codable {
    let isOtpVerified: Bool
    let message: String
    let token: String
}
