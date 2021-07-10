//
//  HomeRouter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import UIKit

typealias EntryPoint = HomeViewProtocol & UIViewController

class HomeRouter: HomeRouterProtocol {
    var entry: EntryPoint?

    func pushToCharacterDetails(with character: Character, from view: UIViewController) {
        let detailsVC = CharacterDetailViewController()
        CharacterDetailRouter.createCharacterDetailView(with: detailsVC, and: character)

        view.navigationController?.pushViewController(detailsVC, animated: true)
    }

    static func start() -> HomeRouterProtocol {
        let router = HomeRouter()

        let view = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()

        view.presenter = presenter

        interactor.presenter = presenter

        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor

        router.entry = view as EntryPoint

        return router
    }
}
