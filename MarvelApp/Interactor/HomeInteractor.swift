//
//  HomeInteractor.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import Domain
import Data
import Foundation

class HomeInteractor/*: HomeInputInteractorProtocol*/ {
    /*var presenter: HomeOutputInteractorProtocol?
    var characters: [Character] = []

    func getCharactersList(with offset: Int) {
        fetchCharacters(with: offset)
    }

    private func fetchCharacters(with offset: Int) {
        NetworkManager.shared.fetchNextCharacters(offset) { result in
            switch result {
            case let .success(response):
                if let chars = response.data?.results {
                    for character in chars {
                        self.characters.append(character)
                    }
                }
                self.presenter?.charactersListDidFetch(characters: self.characters)
            case let .failure(error):
                self.presenter?.displayErrorMessage(ErrorUtils.getError(from: error))
            }
        }
    }*/
}
