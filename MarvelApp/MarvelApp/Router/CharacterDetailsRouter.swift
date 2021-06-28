//
//  CharacterDetailsRouter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 27/06/21.
//

import UIKit

class CharacterDetailsRouter: AnyRouter {
    var entry: EntryPoint?

    static func start(with imageURL: String?) -> AnyRouter {
        let router = CharacterDetailsRouter()

        var view: AnyView = CharacterDetailViewController()
        var presenter: AnyPresenter = CharacterDetailsPresenter()
        var interactor: AnyInteractor = CharacterDetailsInteractor()

        view.presenter = presenter

        interactor.presenter = presenter

        presenter.imageURL = imageURL
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view

        router.entry = view as? EntryPoint

        return router
    }
}
