//
//  CharacterView.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 12/10/21.
//

import Domain
import Foundation

public enum CharacterViewState {
    case success(MarvelCharacter)
    case error(String)
}

public protocol CharacterDetailsView: AnyObject {
    func updateView(state: CharacterViewState)
    func updateImage(data: Data)
}
