//
//  HomeInteractor.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import Foundation

class HomeInteractor: HomeInputInteractorProtocol {
    var presenter: HomeOutputInteractorProtocol?

    func getCharactersList(with offset: Int) {
        fetchCharacters(with: offset)
    }

    private func fetchCharacters(with offset: Int) {
        NetworkManager.shared.fetchNextCharacters(offset) { result in
            switch result {
            case let .success(response):
                self.presenter?.charactersListDidFetch(characters: response.data?.results ?? [])
            case let .failure(error):
                self.presenter?.displayErrorMessage(self.getError(from: error))
            }
        }
    }

    private func getError(from error: MarvelError) -> String {
        switch error {
        case .invalidFormat:
            return "Couldn't decode JSON"
        case .networkError:
            return "Couldn't fetch data"
        }
    }
}
