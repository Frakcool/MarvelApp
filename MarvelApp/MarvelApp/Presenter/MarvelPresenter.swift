//
//  MarvelPresenter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import Foundation

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }

    func interactorDidFetchMarvelResponse(with result: Result<MarvelResponse, Error>)
}

class MarvelPresenter: AnyPresenter {
    var router: AnyRouter?
    var interactor: AnyInteractor?
    var view: AnyView? {
        didSet {
            interactor?.getCharacters()
        }
    }

    func interactorDidFetchMarvelResponse(with result: Result<MarvelResponse, Error>) {
        switch result {
        case .success(let response):
            view?.update(with: response)
        case .failure(let error):
            view?.update(with: error)
        }
    }
}
