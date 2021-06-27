//
//  NetworkManager.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import Foundation
import Moya

final class NetworkManager {
    static let shared = NetworkManager()
    private let provider = MoyaProvider<Endpoints>()

    func fetchCharacters(_ completion: @escaping (Result<MarvelResponse, Error>) -> Void) {
        provider.request(.listCharacters) { result in
            switch result {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let marvelResponse = try filteredResponse.map(MarvelResponse.self)
                    completion(.success(marvelResponse))
                } catch {
                    print("Couldn't decode response from: \(response)")
                    print(error)
                    completion(.failure(error))
                }
            case let .failure(error):
                print("Couldn't fetch data")
                completion(.failure(error))
            }
        }
    }
}
