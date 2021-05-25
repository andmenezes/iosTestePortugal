//
//  DetailProtocols.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import Foundation
import UIKit

// MARK: - Wireframe

protocol DetailWireframeProtocol: class {
    func presentDetail(with navigationController: UINavigationController, book: BooksItemsEntity)
    func showDetail(with navigationController: UINavigationController, book: BooksItemsEntity)
}

// MARK: - Interactor

protocol DetailInteractorInputProtocol {
    var book: BooksItemsEntity { get }
}

// MARK: - Presenter

protocol DetailPresenterInputProtocol: class {
	func viewDidLoad()
	func dismiss()
}

protocol DetailInteractorOutputProtocol: class {
}

// MARK: - View

protocol DetailPresenterOutputProtocol: class {
    var bookImageView: UIImageView! { get set }
    var titleLabel: UILabel! { get set }
    var authorsLabel: UILabel! { get set }
    var publisherLabel: UILabel! { get set }
    var publishedDateLabel: UILabel! { get set }
    var priceLabel: UILabel! { get set }
    var textViewDescription: UITextView! { get set }
}

// MARK: - Analytics

protocol DetailAnalyticsProtocol: class {
}
