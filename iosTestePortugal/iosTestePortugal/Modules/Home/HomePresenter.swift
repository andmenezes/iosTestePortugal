//
//  HomePresenter.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import Foundation
import PaginatedTableView

class HomePresenter: NSObject {

    // MARK: - Viper Properties

    weak var view: HomePresenterOutputProtocol?
    var interactor: HomeInteractorInputProtocol!
    var wireframe: HomeWireframeProtocol!

    // MARK: - Internal Properties
    var books: [BooksItemsEntity] = []
    var page = 0
    var totalBooks = 0
}

// MARK: - HomePresenterInputProtocol

extension HomePresenter: HomePresenterInputProtocol {
    func fetchMoreBooks() {
        self.page += 1
        self.interactor.fetchBooks(page: self.page)
    }

    // MARK: - Internal Methods

    func viewDidLoad() {
        self.interactor.fetchBooks(page: 0)
    }

    func didSelectRowAt(row: Int) {
        let book = self.books[row]
        self.wireframe.showBookDetail(book)
    }
}

// MARK: - HomeInteractorOutputProtocol

extension HomePresenter: HomeInteractorOutputProtocol {
    func setTotalBooks(_ totalBooks: Int) {
        self.totalBooks = totalBooks
    }

    // MARK: - Internal Methods

    func didSuccessFetchBooks(bookItems: [BooksItemsEntity]) {
        if self.page == 0 {
            self.books = bookItems
            self.view?.loadTableView()
        }else {
            self.books.append(contentsOf: bookItems)
            self.view?.tableview.reloadData()
        }
    }

    func didFailFetchBooks() {
        self.view?.showError()
    }
}
