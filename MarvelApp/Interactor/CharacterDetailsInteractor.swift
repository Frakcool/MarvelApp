//
//  CharacterDetailsInteractor.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import Data
import Domain
import Foundation

class CharacterDetailsInteractor/*: CharacterDetailInputInteractorProtocol*/ {
    /*var presenter: CharacterDetailOutputInteractorProtocol?

    func getImage(for character: Character) {
        fetchImage(character)
    }

    private func fetchImage(_ character: Character) {
        NetworkManager.shared.fetchThumbnail(buildURL(for: character)) { result in
            switch result {
            case let .success(response):
                self.presenter?.characterImageDidFetch(image: response)
            case let .failure(error):
                self.presenter?.displayErrorMessage(error: ErrorUtils.getError(from: error))
            }
        }
    }

    private func buildURL(for character: Character) -> String {
        if let path = character.thumbnail?.path,
           let ext = character.thumbnail?.type {
            let size = ImageSizes.amazing.name
            return path + "/" + size + "." + ext
        }
        return ""
    }*/
}
