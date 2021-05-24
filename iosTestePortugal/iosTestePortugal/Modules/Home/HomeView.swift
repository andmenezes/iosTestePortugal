//
//  HomeView.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import UIKit

class HomeView: UIViewController {

    // MARK: - Viper Properties

    var presenter: HomePresenterInputProtocol!

    // MARK: - Outlets

    // MARK: - Internal Properties

    // MARK: - Private Properties

    // MARK: - Inits

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
    }

    // MARK: - Internal Methods

    // MARK: - Private Methods

    // MARK: - Actions

    // MARK: - Notifications

}

// MARK: - HomePresenterOutputProtocol

extension HomeView: HomePresenterOutputProtocol {

    // MARK: - Internal Methods

}
