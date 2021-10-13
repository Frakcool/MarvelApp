//
//  CharacterProvider.swift
//  Data
//
//  Created by Jesús Sánchez on 18/09/21.
//

/*
 Provider -> Pasar data de API / DB a Domain

 Data > Domain > Use Case (MVVM) > UI

 Use Case > Domain > Data
 */

import Domain
import Moya

public class CharacterProvider: CharactersProviderContract {
    // let provider = MoyaProvider<CharacterService>(plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))])

    var provider = MoyaProvider<CharacterService>()

    public init() {
        
    }

    public func characters(offset: Int?, completion: @escaping CharactersListCompletion) {
        provider.request(.listCharacters(offset: offset)) { result in
            switch result {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let marvelResponse = try filteredResponse.map(MarvelResponse.self)

                    var characters: [MarvelCharacter] = []
                    if let charactersList = marvelResponse.data?.results {
                        for character in charactersList {
                            let marvelCharacter = self.convertToDomainCharacter(character)
                            characters.append(marvelCharacter)
                        }
                        completion(.success(characters))
                    } else {
                        completion(.failure(MarvelError.invalidFormat))
                    }
                } catch {
                    completion(.failure(MarvelError.invalidFormat))
                }
            case .failure:
                completion(.failure(MarvelError.networkError))
            }
        }
    }

    public func character(_ id: String, completion: @escaping CharacterCompletion) {
        provider.request(.getCharacter(characterId: id)) { result in
            switch result {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let marvelResponse = try filteredResponse.map(DataCharacter.self)

                    let marvelCharacter = self.convertToDomainCharacter(marvelResponse)

                    completion(.success(marvelCharacter))
                } catch {
                    completion(.failure(MarvelError.invalidFormat))
                }
            case .failure:
                break
            }
        }
    }

    private func convertToDomainCharacter(_ character: DataCharacter) -> MarvelCharacter {
        return MarvelCharacter(id: character.id ?? 0,
                        name: character.name ?? "",
                        description: character.description ?? "",
                        thumbnail: Thumbnail(path: character.thumbnail?.path ?? "",
                                             type: character.thumbnail?.type ?? ""))
    }
}
