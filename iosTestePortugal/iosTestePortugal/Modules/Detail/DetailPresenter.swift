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
}

// MARK: - DetailPresenterInputProtocol

extension DetailPresenter: DetailPresenterInputProtocol {

    // MARK: - Internal Methods

    func viewDidLoad() {
        let book = self.interactor.book

        self.view?.titleLabel?.text = book.volumeInfo.title
        self.view?.authorsLabel?.text = book.volumeInfo.authors?.first
        self.view?.publisherLabel.text = book.volumeInfo.publisher
        self.view?.publishedDateLabel.text = book.volumeInfo.publishedDate
        self.view?.priceLabel.text = String(book.saleInfo?.listPrice?.amount ?? 0)
        self.view?.textViewDescription.text = book.volumeInfo.description

        self.setupThumbnail(book.volumeInfo.imageLinks)
    }

    // MARK: - Private Methods

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
        self.interactor?.fetchImage(with: url)
    }
}

// MARK: - DetailInteractorOutputProtocol

extension DetailPresenter: DetailInteractorOutputProtocol {
    func didFetchBookImage(_ image: UIImage) {
        self.view?.bookImageView?.image = image
    }
}
