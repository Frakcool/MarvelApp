//
//  CharactersView.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 03/10/21.
//

import Domain
import Foundation

public enum CharactersViewState {
    case add([MarvelCharacter])
    case update([MarvelCharacter])
    case error(String)
}

public protocol CharactersView: AnyObject {
    func updateView(state: CharactersViewState)
}
