//
//  HomeInteractor.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import Foundation

class HomeInteractor: NSObject {

    // MARK: - Viper Properties

    weak var output: HomeInteractorOutputProtocol?
}

// MARK: - HomeInteractorInputProtocol

extension HomeInteractor: HomeInteractorInputProtocol {

    // MARK: - Internal Methods

    func fetchBooks(page: Int) {

        let endpoint = APIRoutes.getBooks(page)
        let config = RequestService.request(tag: endpoint, method: .get)

        ApiService.request(config: config, success: { [weak self] result, _ in
            guard let contract = JSONDecoder.decode(BooksEntity.self, from: result) else {
                self?.output?.didFailFetchBooks()
                return
            }

            self?.output?.setTotalBooks(contract.totalItems)
            self?.output?.didSuccessFetchBooks(bookItems: contract.items)

        }) { [weak self] statusCode, _, _ in

            self?.output?.didFailFetchBooks()
        }
    }

    func favoriteBook(bookId: String) {
        
    }
}
