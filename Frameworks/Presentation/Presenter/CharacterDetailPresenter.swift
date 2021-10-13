//
//  CharacterDetailPresenter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import Domain
import Injector
import UIKit

public class CharacterDetailPresenter: Presenter {
    public weak var view: CharacterDetailsView?

    public var character: MarvelCharacter!

    public var useCase: CharacterDetailsUseCase!

    public func viewLoaded() {
        view?.updateView(state: .success(character))
        loadImage()
    }

    public convenience init(view: CharacterDetailsView, character: MarvelCharacter) {
        self.init(view: view, character: character, charactersUseCase: Injector.characterDetailsUseCase)
    }

    init(view: CharacterDetailsView, character: MarvelCharacter, charactersUseCase: CharacterDetailsUseCase) {
        self.view = view
        self.character = character
        self.useCase = charactersUseCase
    }

    private func loadImage() {
        useCase.imageData(url: buildURL(for: character)) { result in
            switch result {
            case let .success(data):
                self.view?.updateImage(data: data)
            case let .failure(error):
                print(error)
                break
            }
        }
    }

    private func buildURL(for character: MarvelCharacter) -> String {
        let path = character.thumbnail.path
        let ext = character.thumbnail.type
        let size = ImageSizes.amazing.name

        return path + "/" + size + "." + ext
    }
}
