//
//  MarvelInteractor.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }

    func getCharacters()
}

class MarvelInteractor: AnyInteractor {
    var presenter: AnyPresenter?

    func getCharacters() {
        
    }
}
