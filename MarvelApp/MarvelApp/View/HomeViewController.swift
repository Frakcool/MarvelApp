//
//  HomeViewController.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import UIKit

protocol AnyView {
    var presenter: AnyPresenter? { get set }

    func update(with characters: MarvelResponse)
    func update(with error: Error)
}

class HomeViewController: UIViewController {
    var presenter: AnyPresenter?
    var characters: [Character] = []
    var offset: Int = 0
    var limit: Int = 20

    private let tableView: UITableView = {
        let table = UITableView()

        table.register(UITableViewCell.self, forCellReuseIdentifier: "characterCell")
        table.isHidden = true

        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tableView.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        cell.textLabel?.text = characters[indexPath.row].name

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row ", indexPath.row, " character: ", characters[indexPath.row])
        let characterDetailsVC = CharacterDetailViewController()
        characterDetailsVC.character = characters[indexPath.row]

        self.navigationController?.pushViewController(characterDetailsVC, animated: true)

        tableView.cellForRow(at: indexPath)?.isSelected = false
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == characters.count - 5 {
            presenter?.interactor?.getNextCharacters(offset, limit)
        }
    }
}

extension HomeViewController: AnyView {
    func update(with response: MarvelResponse) {
        DispatchQueue.main.async {
            if let charactersArray = response.data?.results {
                self.characters.append(contentsOf: charactersArray)
                self.offset = self.characters.count
                self.limit = response.data?.limit ?? 20

                self.tableView.isHidden = false
                self.tableView.reloadData()
            }
        }
    }

    func update(with error: Error) {
        
    }
}
