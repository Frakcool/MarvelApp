//
//  HomeViewController.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import Domain
import Presentation
import UIKit

public class HomeViewController: UIViewController {
    var presenter: HomePresenter!

    var characters = [MarvelCharacter]() {
        didSet {
            tableView.reloadData()

            errorLabel.isHidden = true
            tableView.isHidden = false
        }
    }

    private enum Constants {
        static let cellIdentifier: String = "characterCell"
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

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        presenter = HomePresenter(view: self)
    }

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        presenter = HomePresenter(view: self)
    }

    convenience init() {
        self.init(nibName: nil, bundle: nil)
        presenter = HomePresenter(view: self)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(errorLabel)
        view.addSubview(tableView)

        configureTableView()

        presenter.viewLoaded()
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

    public func showErrorMessage(with error: String) {
        errorLabel.text = error

        errorLabel.isHidden = false
        tableView.isHidden = true
    }
}

extension HomeViewController: CharactersView {
    public func updateView(state: CharactersViewState) {
        switch state {
        case .add(let characters):
            self.characters = characters
        case .update(let characters):
            self.characters.append(contentsOf: characters)
        case .error(let errorString):
            showErrorMessage(with: errorString)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)

        let character = characters[indexPath.row]
        cell.textLabel?.text = character.name

        return cell
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        // presenter?.showCharacterDetail(of: character, from: self)
    }

    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == characters.count - presenter.lastColumns {
            presenter.fetchNextCharacters(offset: characters.count)
        }
    }
}
