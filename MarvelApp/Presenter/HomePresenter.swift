//
//  HomePresenter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import Domain
import UIKit

public class HomePresenter: HomePresenterProtocol {
    public var interactor: HomeInputInteractorProtocol?

    public var view: HomeViewProtocol?

    public var router: HomeRouterProtocol?

    public func getNextCharacters(_ offset: Int) {
        interactor?.getCharactersList(with: offset)
    }

    public func showCharacterDetail(of character: Character, from view: UIViewController) {
        router?.displayCharacterDetails(with: character, from: view)
    }
}

extension HomePresenter: HomeOutputInteractorProtocol {
    public func charactersListDidFetch(characters: [Character]) {
        view?.showCharacters(with: characters)
    }

    public func displayErrorMessage(_ error: String) {
        view?.showErrorMessage(with: error)
    }
}
