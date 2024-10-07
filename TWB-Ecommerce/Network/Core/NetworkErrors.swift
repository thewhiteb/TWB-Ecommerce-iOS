//
//  NetworkErrors.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 07/10/2024.
//

import Foundation
import Alamofire

enum NetworkErrors: Int {
    case parsingError = 1001
    case createUploadableFailed = 1002
    case createURLRequestFailed = 1003
    case downloadedFileMoveFailed = 1004
    case explicitlyCancelled = 1005
    case invalidURL = 1006
    case multipartEncodingFailed = 1007
    case parameterEncodingFailed = 1008
    case parameterEncoderFailed = 1009
    case requestAdaptationFailed = 1010
    case requestRetryFailed = 1011
    case responseValidationFailed = 1012
    case responseSerializationFailed = 1013
    case serverTrustEvaluationFailed = 1014
    case sessionDeinitialized = 1015
    case sessionInvalidated = 1016
    case sessionTaskFailed = 1017
    case urlRequestValidationFailed = 1018

    static func getErrorCode(for error: AFError) -> Int {
        switch error {
        case .createUploadableFailed(error: let error):
            return createUploadableFailed.rawValue
        case .createURLRequestFailed(error: let error):
            return createURLRequestFailed.rawValue
        case .downloadedFileMoveFailed(error: let error, source: let source, destination: let destination):
            return downloadedFileMoveFailed.rawValue
        case .explicitlyCancelled:
            return explicitlyCancelled.rawValue
        case .invalidURL(url: let url):
            return invalidURL.rawValue
        case .multipartEncodingFailed(reason: let reason):
            return multipartEncodingFailed.rawValue
        case .parameterEncodingFailed(reason: let reason):
            return parameterEncodingFailed.rawValue
        case .parameterEncoderFailed(reason: let reason):
            return parameterEncoderFailed.rawValue
        case .requestAdaptationFailed(error: let error):
            return requestAdaptationFailed.rawValue
        case .requestRetryFailed(retryError: let retryError, originalError: let originalError):
            return requestRetryFailed.rawValue
        case .responseValidationFailed(reason: let reason):
            return responseValidationFailed.rawValue
        case .responseSerializationFailed(reason: let reason):
            return responseSerializationFailed.rawValue
        case .serverTrustEvaluationFailed(reason: let reason):
            return serverTrustEvaluationFailed.rawValue
        case .sessionDeinitialized:
            return sessionDeinitialized.rawValue
        case .sessionInvalidated(error: let error):
            return sessionInvalidated.rawValue
        case .sessionTaskFailed(error: let error):
            return sessionTaskFailed.rawValue
        case .urlRequestValidationFailed(reason: let reason):
            return urlRequestValidationFailed.rawValue
        }
    }
}
