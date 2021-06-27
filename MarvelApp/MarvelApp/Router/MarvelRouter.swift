//
//  MarvelRouter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import UIKit

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }

    static func start() -> AnyRouter
}

class MarvelRouter: AnyRouter {
    var entry: EntryPoint?

    static func start() -> AnyRouter {
        let router = MarvelRouter()

        var view: AnyView = HomeViewController()
        var presenter: AnyPresenter = MarvelPresenter()
        var interactor: AnyInteractor = MarvelInteractor()

        view.presenter = presenter

        interactor.presenter = presenter

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view

        router.entry = view as? EntryPoint

        return router
    }
}
