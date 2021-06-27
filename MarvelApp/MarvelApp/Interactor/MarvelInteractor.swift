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
}

class MarvelInteractor: AnyInteractor {
    var presenter: AnyPresenter?

    func getCharacters() {
        NetworkManager.shared.fetchCharacters { result in
            switch result {
            case let .success(response):
                print(response.data?.limit)
                print(response.data?.offset)
                if let results = response.data?.results {
                    for character in results {
                        print(character.name)
                    }
                }
                break
            case let .failure(error):
                break
            }
        }
    }
}
