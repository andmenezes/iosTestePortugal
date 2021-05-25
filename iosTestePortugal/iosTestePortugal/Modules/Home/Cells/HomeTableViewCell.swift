//
//  HomeTableViewCell.swift
//  iosTestePortugal
//
//  Created by André Menezes on 24/05/21.
//

import UIKit
import Alamofire
import AlamofireImage

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var bookImageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var authorsLabel: UILabel?
    @IBOutlet weak var descLabel: UILabel?
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteLabel: UILabel!

    var isFavorite: Bool = false

    static let reuseIdentifier = "HomeTableViewCell"

    func setupCell(_ book: BooksItemsEntity) {
        self.selectionStyle = .none
        self.titleLabel?.text = book.volumeInfo.title
        self.authorsLabel?.text = book.volumeInfo.authors?.first
        self.descLabel?.text = book.volumeInfo.description

        self.setupFavoriteLabel()
        self.setupThumbnail(book.volumeInfo.imageLinks)

    }

    private func setupFavoriteLabel() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.didTouchFavoritButton(_:)))
        self.favoriteLabel.isUserInteractionEnabled = true
        self.favoriteLabel.addGestureRecognizer(labelTap)
    }

    private func setupThumbnail(_ imageLinks: ImageLinksEntity?) {

        guard let link = imageLinks else {
            self.bookImageView?.image = UIImage(named: "BookNotFound")
            return
        }

        if let thumbnail = link.thumbnail  {
            self.getBookImage(url: thumbnail)
        }else if let smallThumbnail = link.smallThumbnail {
            self.getBookImage(url: smallThumbnail)
        }else {
            self.bookImageView?.image = UIImage(named: "BookNotFound")
        }
    }

    private func getBookImage(url: String) {

        Alamofire.request(url).responseImage { response in
            if case .success(let image) = response.result {
                self.bookImageView?.image = image
            }
        }
    }

    @IBAction func didTouchFavoritButton(_ sender: Any) {
        self.isFavorite = !self.isFavorite

        if self.isFavorite {
            self.favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)

        }else {
            self.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
}
