//
//  CharactersDataProvider.swift
//  Data
//
//  Created by Jesús Sánchez on 17/09/21.
//

import Domain
import Foundation
import Moya

protocol CharactersDataProviderProtocol {
    typealias Closure<T> = (Result<T, DataError>) -> Void

    func fetchCharactersList(offset: Int?, completion: @escaping Closure<[DataCharacter]>)
    func fetchCharacterDetails(characterId: String, completion: @escaping Closure<DataCharacter>)
}

class CharactersDataProvider: CharactersDataProviderProtocol {
    var provider = MoyaProvider<CharacterService>()

    public convenience init() {
        self.init(MoyaProvider<CharacterService>())
    }

    init(_ provider: MoyaProvider<CharacterService>) {
        self.provider = provider
    }

    func fetchCharactersList(offset: Int?, completion: @escaping Closure<[DataCharacter]>) {

    }

    func fetchCharacterDetails(characterId: String, completion: @escaping Closure<DataCharacter>) {
        
    }
}
