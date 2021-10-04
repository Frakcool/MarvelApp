//
//  CharactersUseCase.swift
//  Domain
//
//  Created by Jesús Sánchez on 17/09/21.
//

import Foundation

public final class CharactersUseCase {
    let provider: CharactersProviderContract

    public init(_ provider: CharactersProviderContract) {
        self.provider = provider
    }

    public func characters(offset: Int?, completion: @escaping CharactersListCompletion) {
        provider.characters(offset: offset, completion: completion)
    }

    public func character(_ id: String, completion: @escaping CharacterCompletion) {
        provider.character(id, completion: completion)
    }
}
