//
//  MarvelApi.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 06/09/21.
//

import Data
import UIKit

public struct MarvelApi {
    public static let shared = MarvelApi()

    public typealias Closure<T> = (Result<T, MarvelError>) -> Void

    private init() {}

    public func fetchCharacters(offset: Int?, _ completion: @escaping Closure<[MarvelCharacter]>) {
        NetworkManager.shared.fetchNextCharacters(offset ?? 0) { result in
            switch result {
            case .success(let response):
                completion(.success(mapMarvelResponseToCharacter(response)))
            case .failure(let error):
                completion(.failure(mapError(error)))
            }
        }
    }

    public func fetchImage(urlString: String, completion: @escaping Closure<UIImage>) {
        NetworkManager.shared.fetchThumbnail(urlString) { result in
            print(result)
        }
    }

    private func mapMarvelResponseToCharacter(_ response: MarvelResponse) -> [MarvelCharacter] {
        guard let characters = response.data?.results else {
            return []
        }
        var marvelCharacters: [MarvelCharacter] = []
        for character in characters {
            let name = character.name ?? ""
            let description = character.description ?? ""
            let path = character.thumbnail?.path ?? ""
            let type = character.thumbnail?.type ?? ""

            let marvelCharacter = MarvelCharacter(name: name, description: description,
                                            thumbnail: Thumbnail(path: path, type: type))
            marvelCharacters.append(marvelCharacter)
        }
        return marvelCharacters
    }

    private func mapError(_ error: DataError) -> MarvelError {
        switch error {
        case .invalidFormat:
            return MarvelError.invalidFormat
        case .networkError:
            return MarvelError.networkError
        }
    }
}
