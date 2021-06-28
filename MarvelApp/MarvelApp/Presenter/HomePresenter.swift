//
//  MarvelPresenter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import UIKit

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    var imageURL: String? { get set }

    func interactorDidFetchMarvelResponse(with result: Result<MarvelResponse, Error>)
    func interactorDidFetchMarvelImage(with result: Result<UIImage, Error>)
}

class HomePresenter: AnyPresenter {
    var imageURL: String?

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
            switch error {
            case MarvelError.invalidFormat:
                view?.update(with: "Couldn't decode JSON")
            case MarvelError.networkError:
                view?.update(with: "Couldn't fetch data")
            default:
                view?.update(with: "Unknown error")
            }
        }
    }

    func interactorDidFetchMarvelImage(with result: Result<UIImage, Error>) {
        
    }
}
