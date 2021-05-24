//
//  DetailWireframe.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import UIKit

class DetailWireframe: NSObject {

	// MARK: - Constants

	private let nibName = "DetailView"

	// MARK: - Viper Module Properties

	private(set) weak var view: DetailView?

	// MARK: - Private

    private func setupModule() -> DetailView {
        let view = DetailView(nibName: self.nibName, bundle: nil)
        self.view = view
        let interactor = DetailInteractor()
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

	func presentDetail(from sourceViewController: UIViewController) {
        let view = self.setupModule()
        sourceViewController.present(view, animated: true, completion: nil)
    }

    func presentDetail(with navigationController: UINavigationController) {
        let view = self.setupModule()
        navigationController.present(view, animated: true, completion: nil)
    }

    func showDetail(with navigationController: UINavigationController) {
        let view = self.setupModule()
        navigationController.show(view, sender: nil)
    }
}
