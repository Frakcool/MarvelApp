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

    func interactorDidFetchCharacters(with result: Result<[Character], Error>)
}

class MarvelPresenter: AnyPresenter {
    var router: AnyRouter?
    var interactor: AnyInteractor?
    var view: AnyView?

    init() {
        interactor?.getCharacters()
    }

    func interactorDidFetchCharacters(with result: Result<[Character], Error>) {
        
    }
}
