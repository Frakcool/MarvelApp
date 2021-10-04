//
//  HomePresenter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import Domain
import Injector
import UIKit

public class HomePresenter: Presenter {
    private let useCase: CharactersUseCase

    private weak var view: CharactersView?

    public let lastColumns = 5

    private var offset: Int? {
        didSet {
            reload()
        }
    }

    public convenience init(view: CharactersView) {
        self.init(view: view, charactersUseCase: Injector.charactersUseCase)
    }

    init(view: CharactersView, charactersUseCase: CharactersUseCase) {
        self.view = view
        self.useCase = charactersUseCase
    }

    public func viewLoaded() {
        reload()
    }

    func reload() {
        getCharacters(offset: offset)
    }

    public func fetchNextCharacters(offset: Int?) {
        if self.offset != offset {
            self.offset = offset
        }
    }

    private func getCharacters(offset: Int?) {
        useCase.characters(offset: offset) { result in
            switch result {
            case let .success(characters):
                if offset == nil {
                    self.view?.updateView(state: .add(characters))
                } else {
                    self.view?.updateView(state: .update(characters))
                }
            case let .failure(error):
                self.view?.updateView(state: .error(error.localizedError))
            }
        }
    }
}
