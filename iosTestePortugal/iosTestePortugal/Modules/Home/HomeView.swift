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
    @IBOutlet weak var tableview: UITableView!

    // MARK: - Internal Properties
    let strings = HomeStrings.self

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.strings.title
        self.registerTableViewCells()
        self.presenter.viewDidLoad()
    }

    // MARK: - Private Methods
    private func registerTableViewCells() {
        
        let textFieldCell = UINib(nibName: HomeTableViewCell.reuseIdentifier,
                                  bundle: nil)
        self.tableview.register(textFieldCell,
                                forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
    }

    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return indexPath.row >= self.presenter.books.count
      }
}

// MARK: - HomePresenterOutputProtocol

extension HomeView: HomePresenterOutputProtocol {

    // MARK: - Internal Methods
    func loadTableView(){
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.tableview.prefetchDataSource = self
        self.tableview.reloadData()
    }

    func showError(){
        //TODO
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: self.isLoadingCell) {
            self.presenter.fetchMoreBooks()
          }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.totalBooks
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier) as? HomeTableViewCell {
            let book = self.presenter.books[indexPath.row]
            cell.setupCell(book)

            return cell
        }

        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.didSelectRowAt(row: indexPath.row)
    }
}
