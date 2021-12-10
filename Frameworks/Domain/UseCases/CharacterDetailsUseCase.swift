//
//  CharacterDetailsUseCase.swift
//  Domain
//
//  Created by Jesús Sánchez on 12/10/21.
//

import Foundation

public final class CharacterDetailsUseCase {
    let provider: CharacterDetailsProviderContract

    public init(_ provider: CharacterDetailsProviderContract) {
        self.provider = provider
    }

    public func imageData(character: MarvelCharacter, completion: @escaping CharacterImageCompletion) {
        provider.imageData(character: character, completion: completion)
    }
}

