//
//  DetailPresenter.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import Foundation

class DetailPresenter: NSObject {

    // MARK: - Viper Properties

    weak var view: DetailPresenterOutputProtocol?
    var interactor: DetailInteractorInputProtocol!
    var wireframe: DetailWireframeProtocol!

    // MARK: - Internal Properties

    // MARK: - Private Properties

    // MARK: - Inits

    // MARK: - Internal Methods

    // MARK: - Private Methods

    // MARK: - Notifications
}

// MARK: - DetailPresenterInputProtocol

extension DetailPresenter: DetailPresenterInputProtocol {

    // MARK: - Internal Methods

    func viewDidLoad() {
		self.trackScreenView()
    }

	func dismiss() {
		self.trackDismiss()
	}
}

// MARK: - DetailInteractorOutputProtocol

extension DetailPresenter: DetailInteractorOutputProtocol {

    // MARK: - Internal Methods
    
}

// MARK: - Tracker

extension DetailPresenter {

	// MARK: - Private Methods

	func trackScreenView() {
		// TODO: -
	}

	func trackDismiss() {
		// TODO: -
	}
}
