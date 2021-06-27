//
//  HomeViewController.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }

    func update(with characters: [Character])
    func update(with error: Error)
}

class HomeViewController: UIViewController {
    var presenter: AnyPresenter?
    private let tableView: UITableView = {
        let table = UITableView()

        table.register(UITableViewCell.self, forCellReuseIdentifier: "characterCell")
        table.isHidden = true

        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBlue

        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tableView.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension HomeViewController: AnyView {
    func update(with characters: [Character]) {

    }

    func update(with error: Error) {

    }
}
