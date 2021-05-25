//
//  RequestService.swift
//  iosTestePortugal
//
//  Created by André Menezes on 24/05/21.
//

import UIKit
import Alamofire

class RequestService: NSObject {

    class func request(tag: String,
                       method: HTTPMethod,
                       parameters: [String: Any]? = nil,
                       hasDomain: Bool? = false) -> RequestConfig {

        let url = self.generateURL(endpoint: tag)
        let encoding = RequestService.encoding(method)

        return RequestConfig(tag: tag, url: url, method: method, parameters: parameters, headers: nil, parametersEncoding: encoding)
    }

    class func requestURLReplacements(tag: String,
                                      method: HTTPMethod,
                                      parameters: [String: Any]? = nil,
                                      replacements: [String: Any],
                                      hasDomain: Bool? = false) -> RequestConfig {

        let url = self.generateURL(endpoint: tag)
        let encoding = RequestService.encoding(method)
        return RequestConfig(tag: tag, url: url, method: method, parameters: parameters, headers: nil, parametersEncoding: encoding)
    }

    class func encoding(_ method: HTTPMethod) -> ParameterEncoding {
        return method == .get ? URLEncoding.queryString : JSONEncoding.default
    }

    class func generateURL(endpoint: String) -> URL {

        guard let url = URL(string: endpoint as String) else {
            return URL(string: "www.url.com")!
        }

        return url
    }
}

struct ResponseData: Decodable {
    let responseStatus: ResponseStatus
}

struct ResponseStatus: Codable {
    let statusCode: Int?
    let success: Bool
    let message: String
}

