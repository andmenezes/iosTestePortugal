//
//  HomeWireframe.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import UIKit

class HomeWireframe: NSObject {

	// MARK: - Constants

	private let nibName = "HomeView"

	// MARK: - Viper Module Properties

	private(set) weak var view: HomeView?

	// MARK: - Private

    private func setupModule() -> HomeView {
        let view = HomeView(nibName: self.nibName, bundle: nil)
        self.view = view
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        presenter.interactor = interactor
        presenter.wireframe = self
        presenter.view = view
        view.presenter = presenter
        interactor.output = presenter
        return view
    }
}

// MARK: - HomeWireframeProtocol

extension HomeWireframe: HomeWireframeProtocol {

    func showHome(with window: UIWindow) {
        let view = self.setupModule()

        let navigationController = UINavigationController(rootViewController: view)
        navigationController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        window.rootViewController = navigationController
    }

    func showBookDetail(_ book: BooksItemsEntity) {
        guard let navigationController = self.view?.navigationController else {
            return
        }

        let detailWireframe: DetailWireframeProtocol = DetailWireframe()
        detailWireframe.presentDetail(with: navigationController, book: book)
    }
}
