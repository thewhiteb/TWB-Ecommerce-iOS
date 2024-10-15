//
//  LoginRepository.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 14/10/2024.
//

import Foundation

protocol LoginRepository {
    func sendOtp(request: LoginRequest) async -> MainResponse<LoginResponse>
}

struct LoginRepositoryImplementation: LoginRepository {
    
    func sendOtp(request: LoginRequest) async ->  MainResponse<LoginResponse> {
        do {
            let response = try await OTPGenerateAPI(request: request).call()
            return response
        } catch let error {
            let response = MainResponse<LoginResponse>(data: nil,
                                             messages: ["Server is not working!"],
                                             statusCode: (error as NSError).code)
            return response
        }
    }
}
