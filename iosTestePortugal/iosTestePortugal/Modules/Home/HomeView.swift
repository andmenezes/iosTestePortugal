//
//  HomeView.swift
//  André Menezes
//
//  Created André Menezes on 24/5/2021.
//  Copyright © 2021 XP Investimentos. All rights reserved.
//
import UIKit
import PaginatedTableView

class HomeView: UIViewController {

    // MARK: - Viper Properties

    var presenter: HomePresenterInputProtocol!

    // MARK: - Outlets
    @IBOutlet weak var tableview: PaginatedTableView!

    // MARK: - Internal Properties
    let strings = HomeStrings.self

    // MARK: - Private Properties

    // MARK: - Inits

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.strings.title
        self.registerTableViewCells()
        self.presenter.viewDidLoad()
    }

    // MARK: - Internal Methods

    // MARK: - Private Methods
    private func registerTableViewCells() {
        
        let textFieldCell = UINib(nibName: HomeTableViewCell.reuseIdentifier,
                                  bundle: nil)
        self.tableview.register(textFieldCell,
                                forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
    }

    // MARK: - Actions

    // MARK: - Notifications

}

// MARK: - HomePresenterOutputProtocol

extension HomeView: HomePresenterOutputProtocol {

    // MARK: - Internal Methods
    func loadTableView(){
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.tableview.reloadData()

    }

    func showError(){

    }

}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.books.count
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


}
