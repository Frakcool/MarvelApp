//
//  CharacterDetailsInteractor.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 27/06/21.
//

import Foundation

class CharacterDetailsInteractor: AnyInteractor {
    var presenter: AnyPresenter?

    func getCharacters() {

    }

    func getNextCharacters(_ offset: Int, _ limit: Int) {
        
    }

    func getCharacterThumbnail(_ urlString: String) {
        NetworkManager.shared.fetchThumbnail(urlString) { result in
            switch result {
            case let .success(response):
                self.presenter?.interactorDidFetchMarvelImage(with: .success(response))
            case let .failure(error):
                self.presenter?.interactorDidFetchMarvelImage(with: .failure(error))
            }
        }
    }
}
