import Foundation
import Alamofire

protocol Endpoint {
    associatedtype ResponseType: Codable

    var pathURL: String { get }
    var headers: HTTPHeaders { get }
    var httpMethod: HTTPMethod { get }
    var baseURL: String { get }
    var encoding: ParameterEncoding { get }   // Use `ParameterEncoding` instead of `URLEncoding` for flexibility
}


extension Endpoint {
    func call() async throws -> ResponseType {
        let completeURL = baseURL + pathURL
        guard let url = URL(string: completeURL) else {
            throw AFError.parameterEncodingFailed(reason: .missingURL)
        }

        // Use Alamofire's built-in async/await functionality
        let response = AF.request(url, method: httpMethod, encoding: encoding, headers: headers)
            .validate()
            .serializingData()  // Alamofire’s built-in async/await version

        let result = await response.result
        switch result {
        case .success(let data):
            return try parseData(using: data)  // Parse the data into the expected ResponseType
        case .failure(let error):
            throw error  // Forward Alamofire error
        }
    }

    func parseData(using data: Data) throws -> ResponseType {
        // Use JSONDecoder to decode the data into ResponseType
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ResponseType.self, from: data)
        } catch {
            // Handle decoding errors
            throw NSError(domain: "Decoding Error",
                          code: 101,
                          userInfo: ["reason": "Failed to decode response data"])
        }
    }
}

extension Endpoint {
    func getDefaultHeaders() -> HTTPHeaders {
        return [
            Constants.HeadersKeys.appVersion: Device.versionBuildNumber,
            Constants.HeadersKeys.osVersion: Device.osVersion,
            Constants.HeadersKeys.deviceModel: Device.deviceModel
        ]
    }
}
