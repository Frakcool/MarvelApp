//
//  NetworkManager.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import UIKit
import Moya

enum MarvelError: Error {
    case networkError
    case invalidFormat
}

final class NetworkManager {
    typealias Closure<T> = (Result<T, MarvelError>) -> Void

    static let shared = NetworkManager()
    var provider = MoyaProvider<Endpoints>()

    func fetchCharacters(_ completion: @escaping Closure<MarvelResponse>) {
        provider.request(.listCharacters) { result in
            switch result {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let marvelResponse = try filteredResponse.map(MarvelResponse.self)
                    completion(.success(marvelResponse))
                } catch {
                    print("Couldn't decode response ", error)
                    completion(.failure(MarvelError.invalidFormat))
                }
            case let .failure(error):
                print("Couldn't fetch data ", error)
                completion(.failure(MarvelError.networkError))
            }
        }
    }

    func fetchNextCharacters(_ offset: Int, _ limit: Int, _ completion: @escaping Closure<MarvelResponse>) {
        provider.request(.listNextCharacters(offset: offset, limit: limit)) { result in
            switch result {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let marvelResponse = try filteredResponse.map(MarvelResponse.self)
                    completion(.success(marvelResponse))
                } catch {
                    print("Couldn't decode response ", error)
                    completion(.failure(MarvelError.invalidFormat))
                }
            case let .failure(error):
                print("Couldn't fetch data ", error)
                completion(.failure(MarvelError.networkError))
            }
        }
    }

    func fetchThumbnail(_ urlString: String, _ completion: @escaping Closure<UIImage>) {
        provider.request(.fetchThumbnail(urlString: urlString)) { result in
            switch result {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let marvelResponse = try filteredResponse.mapImage()
                    completion(.success(marvelResponse))
                } catch {
                    print("Couldn't decode response ", error)
                    completion(.failure(MarvelError.invalidFormat))
                }
            case let .failure(error):
                print("Couldn't fetch data ", error)
                completion(.failure(MarvelError.networkError))
            }
        }
    }
}
