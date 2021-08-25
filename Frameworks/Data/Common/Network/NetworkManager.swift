//
//  NetworkManager.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import Domain
import UIKit
import Moya

public final class NetworkManager {
    // To make the class a singleton
    private init() {}

    public typealias Closure<T> = (Result<T, MarvelError>) -> Void

    public static let shared = NetworkManager()
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
                    completion(.failure(MarvelError.invalidFormat))
                }
            case .failure:
                completion(.failure(MarvelError.networkError))
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
                } catch {
                    completion(.failure(MarvelError.invalidFormat))
                }
            case .failure:
                completion(.failure(MarvelError.networkError))
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
                    completion(.failure(MarvelError.invalidFormat))
                }
            case .failure:
                completion(.failure(MarvelError.networkError))
            }
        }
    }
}
