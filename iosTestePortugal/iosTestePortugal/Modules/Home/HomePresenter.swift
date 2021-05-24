//
//  HomePresenter.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import Foundation

class HomePresenter: NSObject {

    // MARK: - Viper Properties

    weak var view: HomePresenterOutputProtocol?
    var interactor: HomeInteractorInputProtocol!
    var wireframe: HomeWireframeProtocol!

    // MARK: - Internal Properties

    // MARK: - Private Properties

    // MARK: - Inits

    // MARK: - Internal Methods

    // MARK: - Private Methods

    // MARK: - Notifications
}

// MARK: - HomePresenterInputProtocol

extension HomePresenter: HomePresenterInputProtocol {

    // MARK: - Internal Methods

    func viewDidLoad() {
		self.trackScreenView()
    }

	func dismiss() {
		self.trackDismiss()
	}
}

// MARK: - HomeInteractorOutputProtocol

extension HomePresenter: HomeInteractorOutputProtocol {

    // MARK: - Internal Methods
    
}

// MARK: - Tracker

extension HomePresenter {

	// MARK: - Private Methods

	func trackScreenView() {
		// TODO: -
	}

	func trackDismiss() {
		// TODO: -
	}
}
