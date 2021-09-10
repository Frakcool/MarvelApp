//
//  HomeController.swift
//  Presentation
//
//  Created by Jesús Sánchez on 09/09/21.
//

import Domain
import Foundation

public class HomeViewModel {
    @objc public dynamic var characters: [MarvelCharacter] = []
    @objc public dynamic var error: String = ""

    public typealias Closure<T> = (Result<T, MarvelError>) -> Void

    public init() {}

    public func fetchCharacters(offset: Int?, _ completion: @escaping Closure<[MarvelCharacter]>) {
        MarvelApi.shared.fetchCharacters(offset: offset) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.characters = response
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = ErrorUtils.getError(from: error)
                }
            }
        }
    }
}
