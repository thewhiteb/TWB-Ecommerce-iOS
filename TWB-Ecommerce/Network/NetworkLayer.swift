import Foundation
import Alamofire

protocol Endpoint {
    associatedtype ResponseType: Codable

    var pathURL: String { get }
    var headers: HTTPHeaders { get }
    var httpMethod: HTTPMethod { get }
    var baseURL: String { get }
    var encoding: JSONEncoding  { get } // Use `ParameterEncoding` instead of `URLEncoding` for flexibility
    var params: [String: Any] { get }
    var contentType: String { get }
}

extension Endpoint {

    func call() async throws -> ResponseType {
        let completeURL = baseURL + pathURL
        guard let url = URL(string: completeURL) else {
            throw AFError.parameterEncodingFailed(reason: .missingURL)
        }
        let request = getRequest(using: url)
        // Print cURL command
        request.cURLDescription { curl in
            print(curl)
        }
        // Use Alamofire's built-in async/await functionality
        let response = request
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

    private func getRequest(using url: URL) -> DataRequest {
        // Create Alamofire Request
        let request: DataRequest
        if httpMethod == .get {
            request = AF.request(url,
                                 method: httpMethod,
                                 encoding: encoding,
                                 headers: getHeaders())
        } else {
            request = AF.request(url,
                                 method: httpMethod,
                                 parameters: params,
                                 encoding: encoding,
                                 headers: getHeaders())
        }
        return request
    }

    private func parseData(using data: Data) throws -> ResponseType {
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
