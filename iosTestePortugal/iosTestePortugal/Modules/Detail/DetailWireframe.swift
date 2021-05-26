//
//  DetailWireframe.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import UIKit
import SafariServices

class DetailWireframe: NSObject {

	// MARK: - Constants

	private let nibName = "DetailView"

	// MARK: - Viper Module Properties

	private(set) weak var view: DetailView?

	// MARK: - Private

    private func setupModule(_ book: BooksItemsEntity) -> DetailView {
        let view = DetailView(nibName: self.nibName, bundle: nil)
        self.view = view
        let interactor = DetailInteractor(book)
        let presenter = DetailPresenter()
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = view
        view.presenter = presenter
        interactor.output = presenter
        return view
    }
}

// MARK: - DetailWireframeProtocol

extension DetailWireframe: DetailWireframeProtocol {

    func presentDetail(with navigationController: UINavigationController, book: BooksItemsEntity) {
        let view = self.setupModule(book)
        navigationController.present(view, animated: true, completion: nil)
    }

    func showDetail(with navigationController: UINavigationController, book: BooksItemsEntity) {
        let view = self.setupModule(book)
        navigationController.show(view, sender: nil)
    }

    func presentBuyLink(url: URL) {
        let safari = SFSafariViewController(url: url)
        self.view?.present(safari, animated: true, completion: nil)
    }
}
