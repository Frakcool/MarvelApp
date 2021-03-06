//
//  HomeViewController.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import UIKit

class HomeViewController: UIViewController {
    var presenter: HomePresenterProtocol?
    var characters: [Character] = []

    private enum Constants {
        static let cellIdentifier: String = "characterCell"
        static let lastColumns = 5
    }

    private let tableView: UITableView = {
        let table = UITableView()

        table.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        table.isHidden = true

        return table
    }()

    private let errorLabel: UILabel = {
        let label = UILabel()

        label.textAlignment = .center
        label.isHidden = true

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(errorLabel)
        view.addSubview(tableView)

        configureTableView()
        presenter?.getNextCharacters(0)
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false

        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: safeArea.heightAnchor),

            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            errorLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            errorLabel.heightAnchor.constraint(equalTo: safeArea.heightAnchor)
        ])
    }
}

// MARK: VIPER

extension HomeViewController: HomeViewProtocol {
    func showCharacters(with characters: [Character]) {
        self.characters = characters
        tableView.reloadData()

        errorLabel.isHidden = true
        tableView.isHidden = false
    }

    func showErrorMessage(with error: String) {
        errorLabel.text = error

        errorLabel.isHidden = false
        tableView.isHidden = true
    }
}

// MARK: TableView

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)

        let character = characters[indexPath.row]
        cell.textLabel?.text = character.name

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showCharacterDetail(of: character, from: self)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == characters.count - Constants.lastColumns {
            presenter?.getNextCharacters(characters.count)
        }
    }
}
