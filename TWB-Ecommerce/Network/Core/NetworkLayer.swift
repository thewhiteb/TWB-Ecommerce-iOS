import Foundation
import Alamofire

protocol Endpoint {
    associatedtype ResponseType: Codable

    var pathURL: String { get }
    var headers: HTTPHeaders { get }
    var httpMethod: HTTPMethod { get }
    var baseURL: String { get }
    var encoding: ParameterEncoding  { get }
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
        printCurl(using: request)
        // Use Alamofire's built-in async/await functionality
        let response = await request
            .validate()
            .serializingData()
            .response
        let result = response.result
        switch result {
        case .success(let data):
            return try parseData(using: data)
        case .failure(let error):
            logNonFetalException()
            if let statusCode = response.response?.statusCode {
                if (400...599).contains(statusCode), let data = response.data {
                    return try parseData(using: data)
                }
            }
            throw NSError(domain: "Alamofire Error",
                          code: NetworkErrors.getErrorCode(for: error),
                          userInfo: ["reason": "\(error.localizedDescription)",
                                     "urlPath": url.absoluteString])
        }
    }

    private func getRequest(using url: URL) -> DataRequest {
        // Create Alamofire Request
        let request: DataRequest
        request = AF.request(url,
                             method: httpMethod,
                             parameters: params,
                             encoding: encoding,
                             headers: getHeaders())
        return request
    }

    private func parseData(using data: Data) throws -> ResponseType {
        // Use JSONDecoder to decode the data into ResponseType
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ResponseType.self, from: data)
        } catch let error {
            // Handle decoding errors
            print("Error in parsing: \(error.localizedDescription)")
            print("URL Path: \(self.pathURL)")
            throw NSError(domain: "Decoding Error",
                          code: NetworkErrors.parsingError.rawValue,
                          userInfo: ["reason": "Failed to decode response data",
                                    "urlPath": self.pathURL])
        }
    }

    private func printCurl(using request: DataRequest) {
        request.cURLDescription { curl in
            print(curl)
        }
    }

    private func logNonFetalException() {
        //TODO: - Log non fetal exception over the firebase
        print("API Failed for \(self.pathURL)")
    }
}
