//
//  NetworkManager.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import UIKit
import Moya

public final class CharactersService2 {

    /*public static let shared = NetworkManager()
    var provider = MoyaProvider<Endpoints>()

    public func fetchCharacters(_ completion: @escaping Closure<MarvelResponse>) {
        provider.request(.listCharacters) { result in
            switch result {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let marvelResponse = try filteredResponse.map(MarvelResponse.self)
                    completion(.success(marvelResponse))
                } catch {
                    completion(.failure(DataError.invalidFormat))
                }
            case .failure:
                completion(.failure(DataError.networkError))
            }
        }
    }

    public func fetchNextCharacters(_ offset: Int, _ completion: @escaping Closure<MarvelResponse>) {
        provider.request(.listNextCharacters(offset: offset)) { result in
            switch result {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let marvelResponse = try filteredResponse.map(MarvelResponse.self)
                    completion(.success(marvelResponse))
                    // completion(.failure(DataError.invalidFormat))
                } catch {
                    completion(.failure(DataError.invalidFormat))
                }
            case .failure:
                completion(.failure(DataError.networkError))
            }
        }
    }

    public func fetchThumbnail(_ urlString: String, _ completion: @escaping Closure<UIImage>) {
        provider.request(.fetchThumbnail(urlString: urlString)) { result in
            switch result {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let marvelResponse = try filteredResponse.mapImage()
                    completion(.success(marvelResponse))
                } catch {
                    completion(.failure(DataError.invalidFormat))
                }
            case .failure:
                completion(.failure(DataError.networkError))
            }
        }
    }*/
}
