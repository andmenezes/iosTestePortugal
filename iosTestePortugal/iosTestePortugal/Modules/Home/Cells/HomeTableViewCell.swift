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
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var descTextView: UITextView?
    @IBOutlet weak var favoriteButton: UIButton!
    var isFavorite: Bool = false

    static let reuseIdentifier = "HomeTableViewCell"

    func setupCell(_ book: BooksItemsEntity) {
        self.titleLabel?.text = book.volumeInfo.title
        self.authorsLabel.text = book.volumeInfo.authors.first
        self.descTextView?.text = book.volumeInfo.description
        self.descTextView?.isEditable = false

        if let imageLinks = book.volumeInfo.imageLinks, let thumbnail = imageLinks.thumbnail  {
            self.getBookImage(url: thumbnail)
        }else if let imageLinks = book.volumeInfo.imageLinks, let smallThumbnail = imageLinks.smallThumbnail {
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
