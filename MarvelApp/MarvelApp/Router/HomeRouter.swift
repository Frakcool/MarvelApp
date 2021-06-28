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

    static func start(with imageURL: String?) -> AnyRouter
}

class HomeRouter: AnyRouter {
    var entry: EntryPoint?

    static func start(with imageURL: String?) -> AnyRouter {
        let router = HomeRouter()

        var view: AnyView = HomeViewController()
        var presenter: AnyPresenter = HomePresenter()
        var interactor: AnyInteractor = HomeInteractor()

        view.presenter = presenter

        interactor.presenter = presenter

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view

        router.entry = view as? EntryPoint

        return router
    }
}
