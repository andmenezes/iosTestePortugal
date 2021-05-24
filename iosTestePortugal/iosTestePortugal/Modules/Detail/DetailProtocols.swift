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
    func presentDetail(from sourceViewController: UIViewController)
    func presentDetail(with navigationController: UINavigationController)
}

// MARK: - Interactor

protocol DetailInteractorInputProtocol {
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

}

// MARK: - Analytics

protocol DetailAnalyticsProtocol: class {
}
