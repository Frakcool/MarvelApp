//
//  HomePresenter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import UIKit

class HomePresenter: HomePresenterProtocol {
    var interactor: HomeInputInteractorProtocol?

    var view: HomeViewProtocol?

    var router: HomeRouterProtocol?

    func getNextCharacters(_ offset: Int) {
        interactor?.getCharactersList(with: offset)
    }

    func showCharacterDetail(of character: Character, from view: UIViewController) {
        router?.displayCharacterDetails(with: character, from: view)
    }
}

extension HomePresenter: HomeOutputInteractorProtocol {
    func charactersListDidFetch(characters: [Character]) {
        view?.showCharacters(with: characters)
    }

    func displayErrorMessage(_ error: String) {
        view?.showErrorMessage(with: error)
    }
}
