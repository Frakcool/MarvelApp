//
//  CharacterContract.swift
//  Domain
//
//  Created by Jesús Sánchez on 17/09/21.
//

import Foundation

public typealias CharacterCompletion = (_ result: Result<MarvelCharacter, MarvelError>) -> Void

public typealias CharactersListCompletion = (_ result: Result<[MarvelCharacter], MarvelError>) -> Void

public protocol CharactersContract {
    func characters(offset: Int?, completion: @escaping CharactersListCompletion)
    func character(_ id: String, completion: @escaping CharacterCompletion)
}
