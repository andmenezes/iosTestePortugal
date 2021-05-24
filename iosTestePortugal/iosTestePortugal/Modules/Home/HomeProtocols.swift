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
}

// MARK: - Interactor

protocol HomeInteractorInputProtocol {
}

// MARK: - Presenter

protocol HomePresenterInputProtocol: class {
	func viewDidLoad()
	func dismiss()
}

protocol HomeInteractorOutputProtocol: class {
}

// MARK: - View

protocol HomePresenterOutputProtocol: class {

}

// MARK: - Analytics

protocol HomeAnalyticsProtocol: class {
}
