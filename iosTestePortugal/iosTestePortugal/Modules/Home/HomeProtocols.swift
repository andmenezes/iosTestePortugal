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
	func viewDidLoad()
    func didSelectRowAt(row: Int)
    func dismiss()

}

protocol HomeInteractorOutputProtocol: class {
    func didSuccessFetchBooks(bookItems: [BooksItemsEntity])
    func didFailFetchBooks()
}

// MARK: - View

protocol HomePresenterOutputProtocol: class {
    func loadTableView()
    func showError()

}

// MARK: - Analytics

protocol HomeAnalyticsProtocol: class {
}
