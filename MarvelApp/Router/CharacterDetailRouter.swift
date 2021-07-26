//
//  CharacterDetailRouter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import UIKit

class CharacterDetailRouter: CharacterDetailRouterProtocol {
    class func createCharacterDetailView(with view: CharacterDetailViewController, and character: Character) {
        let router = CharacterDetailRouter()
        let presenter = CharacterDetailPresenter()
        let interactor = CharacterDetailsInteractor()

        view.presenter = presenter

        interactor.presenter = presenter

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.character = character
    }
}
