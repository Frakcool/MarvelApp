//
//  MarvelInteractor.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }

    func getCharacters()
    func getNextCharacters(_ offset: Int, _ limit: Int)
    func getCharacterThumbnail(_ urlString: String)
}

class HomeInteractor: AnyInteractor {
    var presenter: AnyPresenter?

    func getCharacters() {
        NetworkManager.shared.fetchCharacters { result in
            switch result {
            case let .success(response):
                self.presenter?.interactorDidFetchMarvelResponse(with: .success(response))
                break
            case let .failure(error):
                self.presenter?.interactorDidFetchMarvelResponse(with: .failure(error))
                break
            }
        }
    }

    func getNextCharacters(_ offset: Int, _ limit: Int) {
        NetworkManager.shared.fetchNextCharacters(offset, limit) { result in
            switch result {
            case let .success(response):
                self.presenter?.interactorDidFetchMarvelResponse(with: .success(response))
            case let .failure(error):
                self.presenter?.interactorDidFetchMarvelResponse(with: .failure(error))
            }
        }
    }

    func getCharacterThumbnail(_ urlString: String) {
        
    }
}
