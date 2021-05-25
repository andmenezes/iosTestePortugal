//
//  ApiService.swift
//  iosTestePortugal
//
//  Created by André Menezes on 24/05/21.
//

import Foundation
import Alamofire

struct headerKey {
    static let userAgent = "User-Agent"
}

struct headerValue {
    static let iphone = "iphone"
}

enum ApiRequestError: Int {
    case networkConnection
    case badRequest = 400
    case unauthorized = 401
    case notFound = 404
    case error = 500
    case timeout = 504
}

struct RequestConfig {
    var tag: String
    var url: URL
    var method: HTTPMethod
    var parameters: Parameters?
    var headers: HTTPHeaders?
    var parametersEncoding: ParameterEncoding? = JSONEncoding.default
}

struct ApiErrorEntity: Codable {
    var errorCode: String?
    var errorMessage: String?
}

typealias success = ((_ result: String?, _ statusCode: Int) -> Void)
typealias successData = ((_ result: Data?, _ statusCode: Int) -> Void)
typealias failure = ((_ statusCode: Int, _ errorMessage: String, _ result: String?) -> Void)
typealias completionAction = ((_ success: Bool, _ message: String) -> Void)
typealias authenticateAction = ((_ success: Bool) -> Void)
typealias ipAction = ((_ ip: String) -> Void)

class ApiService: NSObject {

    static var accessToken: String?
    static var activateAccessToken: String?
    static var quizAccessToken: String?

    class func request(config: RequestConfig, success: @escaping success, failure: @escaping failure) {

        Alamofire.request(config.url,
                          method: config.method,
                          parameters: config.parameters,
                          encoding: config.parametersEncoding!,
                          headers: nil
            )
            .validate(statusCode: 200..<300)
            .debugLog()
            .responseString(encoding: String.Encoding.utf8) { (response) in

                let responseResult = response.value

                switch response.result {
                case .success: success(ApiService.restFormatter(value: responseResult), response.response?.statusCode ?? 200)
                case .failure:
                    guard let error = JSONDecoder.decode([ApiErrorEntity].self, from: responseResult), let errorMessage = error.first?.errorMessage else {
                        failure(response.response?.statusCode ?? 500, "", ApiService.restFormatter(value: responseResult))
                        return
                    }
                    failure(response.response?.statusCode ?? 500, "", errorMessage)
                }
        }
    }

    class func dataRequest(config: RequestConfig, success: @escaping successData, failure: @escaping failure) {

        Alamofire.request(config.url,
                          method: config.method,
                          parameters: config.parameters,
                          encoding: config.parametersEncoding!,
                          headers: nil
            )
            .validate(statusCode: 200..<300)
            .debugLog()
            .responseData { (response) in
                switch response.result {
                case .success: success(response.data, response.response?.statusCode ?? 200)
                case .failure:
                    failure(response.response?.statusCode ?? 500, "", nil)
                }
        }
    }

    class func restFormatter(value: String?) -> String {
        guard let result = value else {
            return ""
        }

        return result
    }
}

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
            debugPrint(self)
        #endif
        return self
    }
}
