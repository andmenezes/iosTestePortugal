//
//  JSONDecoderExtension.swift
//  iosTestePortugal
//
//  Created by André Menezes on 24/05/21.
//

import Foundation

extension JSONDecoder {

    static func decode<T>(_ type: T.Type, from jsonString: String?) -> T? where T: Decodable {
        let decoder = JSONDecoder()
        guard let data = jsonString, let jsonData = data.data(using: .utf8) else {
            return nil
        }

        do {
            let obj = try decoder.decode(type, from: jsonData)
            return obj
        } catch {
            print(error)
            return nil
        }
    }

    static func decode<T>(_ type: T.Type, from json: Data?) -> T? where T: Decodable {
        let decoder = JSONDecoder()
        guard let data = json else {
            return nil
        }

        do {
            let obj = try decoder.decode(type, from: data)
            return obj
        } catch {
            print(error)
            return nil
        }
    }
}

