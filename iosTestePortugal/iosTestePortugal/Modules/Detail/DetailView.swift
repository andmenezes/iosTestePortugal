//
//  DetailView.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import UIKit

class DetailView: UIViewController {

    // MARK: - Viper Properties

    var presenter: DetailPresenterInputProtocol!

    // MARK: - Outlets
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var textViewDescription: UITextView!

    // MARK: - Internal Properties

    // MARK: - Private Properties

    // MARK: - Inits

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textViewDescription.isEditable = false
        self.textViewDescription.isSelectable = false
        self.presenter.viewDidLoad()
    }

    // MARK: - Internal Methods

    // MARK: - Private Methods

    // MARK: - Actions

    // MARK: - Notifications

}

// MARK: - DetailPresenterOutputProtocol

extension DetailView: DetailPresenterOutputProtocol {

    // MARK: - Internal Methods

}
