//
//  CharacterDetailsPresenter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 27/06/21.
//

import UIKit

class CharacterDetailsPresenter: AnyPresenter {
    var imageURL: String?

    var router: AnyRouter?
    var interactor: AnyInteractor?
    var view: AnyView? {
        didSet {
            if let urlString = imageURL {
                interactor?.getCharacterThumbnail(urlString)
            }
        }
    }

    func interactorDidFetchMarvelResponse(with result: Result<MarvelResponse, Error>) {
        
    }

    func interactorDidFetchMarvelImage(with result: Result<UIImage, Error>) {
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
}
