//
//  CharacterDetailsProvider.swift
//  Domain
//
//  Created by Jesús Sánchez on 12/10/21.
//

import Domain
import Moya

public class CharacterDetailsProvider: CharacterDetailsProviderContract {
    // let provider = MoyaProvider<CharacterService>(plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))])

    var provider = MoyaProvider<CharacterService>()

    public init() {

    }

    public func imageData(character: MarvelCharacter, completion: @escaping CharacterImageCompletion) {
        let url = buildURL(for: character)

        provider.request(.fetchThumbnail(urlString: url)) { result in
            switch result {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let marvelResponse = filteredResponse.data
                    completion(.success(marvelResponse))
                } catch {
                    completion(.failure(MarvelError.invalidFormat))
                }
            case .failure:
                completion(.failure(MarvelError.networkError))
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

    private func buildURL(for character: MarvelCharacter) -> String {
        let path = character.thumbnail.path
        let ext = character.thumbnail.type
        let size = ImageSizes.amazing.name

        return path + "/" + size + "." + ext
    }
}
