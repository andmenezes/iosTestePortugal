//
//  APIRoutes.swift
//  iosTestePortugal
//
//  Created by André Menezes on 24/05/21.
//

import Foundation

struct APIRoutes {
    static func getBooks(_ index: Int) -> String {
        return "https://www.googleapis.com/books/v1/volumes?q=ios&maxResults=40&startIndex=\(index)"
    }
}
