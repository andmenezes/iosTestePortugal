//
//  HomeProtocols.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import Foundation
import UIKit

// MARK: - Wireframe

protocol HomeWireframeProtocol: class {
    func showHome(with window: UIWindow)
    func showBookDetail(_ book: BooksItemsEntity)
}

// MARK: - Interactor

protocol HomeInteractorInputProtocol {
    func fetchBooks(page: Int)
    func favoriteBook(bookId: String)
}

// MARK: - Presenter

protocol HomePresenterInputProtocol: class {
    var books: [BooksItemsEntity] { get }
    var totalBooks: Int { get }
	func viewDidLoad()
    func didSelectRowAt(row: Int)
    func fetchMoreBooks()
}

protocol HomeInteractorOutputProtocol: class {
    func setTotalBooks(_ totalBooks: Int)
    func didSuccessFetchBooks(bookItems: [BooksItemsEntity])
    func didFailFetchBooks()
}

// MARK: - View

protocol HomePresenterOutputProtocol: class {
    var tableview: UITableView! { get set}
    func loadTableView()
    func showError()

}

// MARK: - Analytics

protocol HomeAnalyticsProtocol: class {
}
