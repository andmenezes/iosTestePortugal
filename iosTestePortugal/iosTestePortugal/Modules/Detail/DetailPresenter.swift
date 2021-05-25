//
//  DetailPresenter.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import UIKit
import Alamofire
import AlamofireImage

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
        let book = self.interactor.book

        self.view?.titleLabel?.text = book.volumeInfo.title
        self.view?.authorsLabel?.text = book.volumeInfo.authors?.first
        self.view?.publisherLabel.text = book.volumeInfo.publisher
        self.view?.publishedDateLabel.text = book.volumeInfo.publishedDate
        self.view?.textViewDescription.text = book.volumeInfo.description

        self.setupFavoriteLabel()
        self.setupThumbnail(book.volumeInfo.imageLinks)
    }

    // MARK: - Private Methods

    private func setupFavoriteLabel() {
//        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.didTouchFavoritButton(_:)))
//        self.favoriteLabel.isUserInteractionEnabled = true
//        self.favoriteLabel.addGestureRecognizer(labelTap)
    }

    private func setupThumbnail(_ imageLinks: ImageLinksEntity?) {

        guard let link = imageLinks else {
            self.view?.bookImageView?.image = UIImage(named: "BookNotFound")
            return
        }

        if let thumbnail = link.thumbnail  {
            self.getBookImage(url: thumbnail)
        }else if let smallThumbnail = link.smallThumbnail {
            self.getBookImage(url: smallThumbnail)
        }else {
            self.view?.bookImageView?.image = UIImage(named: "BookNotFound")
        }
    }

    private func getBookImage(url: String) {

        Alamofire.request(url).responseImage { response in
            if case .success(let image) = response.result {
                self.view?.bookImageView?.image = image
            }
        }
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
