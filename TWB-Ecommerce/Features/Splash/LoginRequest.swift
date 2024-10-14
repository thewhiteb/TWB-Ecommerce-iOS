//
//  LoginRequest.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 14/10/2024.
//

import Foundation

struct LoginRequest: Codable {
    let name: String?
    let phoneNumber: String
    let email: String?
    let otpTypeEnum: String
    let userTypeEnum: String
    let sendOtpViaEnum: String
}
