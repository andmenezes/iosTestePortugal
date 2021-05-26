//
//  DetailInteractor.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import Foundation
import Alamofire
import AlamofireImage

class DetailInteractor: NSObject {

    // MARK: - Viper Properties

    weak var output: DetailInteractorOutputProtocol?

    // MARK: - Inits

    required init(_ book: BooksItemsEntity) {
        self.book = book
    }

    // MARK: - Internal Methods
    var book: BooksItemsEntity
}

// MARK: - DetailInteractorInputProtocol

extension DetailInteractor: DetailInteractorInputProtocol {

    // MARK: - Internal Methods
    func fetchImage(with url: String) {

        Alamofire.request(url).responseImage { response in
            if case .success(let image) = response.result {
                self.output?.didFetchBookImage(image)
            }
        }
    }
}
