//
//  BookEntity.swift
//  iosTestePortugal
//
//  Created by André Menezes on 24/05/21.
//

import Foundation

struct BooksEntity: Decodable {
    let items: [BooksItemsEntity]
}

struct BooksItemsEntity: Decodable {
    let id: String
    let volumeInfo: VolumeInfoEntity
    let saleInfo: SaleInfoEntity?

}

struct VolumeInfoEntity: Decodable {
    let title: String
    let authors: [String]?
    let publisher: String?
    let publishedDate: String?
    let description: String
    let imageLinks: ImageLinksEntity?
}

struct SaleInfoEntity: Decodable {
    let isEbook: Bool?
    let listPrice: ListPriceEntity?
    let buyLink: String?
}

struct ImageLinksEntity: Decodable {
    let smallThumbnail: String?
    let thumbnail: String?
}

struct ListPriceEntity: Decodable {
    let amount: Float?
    let currencyCode: String?
}
