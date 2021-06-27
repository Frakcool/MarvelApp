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

    func fetchCharacters(_ completion: Result<MarvelResponse, Error>) {
        provider.request(.listCharacters) { result in
            switch result {
            case let .success(response):
                // TODO: decode response.data 
                break
            case let .failure(error):
                break
            }
        }
    }
}
