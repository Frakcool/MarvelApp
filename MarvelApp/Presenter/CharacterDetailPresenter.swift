//
//  CharacterDetailPresenter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import Domain
import UIKit

public class CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    public var interactor: CharacterDetailInputInteractorProtocol?

    public var view: CharacterDetailViewProtocol?

    public var router: CharacterDetailRouterProtocol?

    var character: Character!
    var image: UIImage?

    public func viewDidLoad() {
        view?.showCharacterDetails(with: character)
        interactor?.getImage(for: character)
    }
}

extension CharacterDetailPresenter: CharacterDetailOutputInteractorProtocol {
    public func characterImageDidFetch(image: UIImage) {
        view?.showCharacterImage(with: image)
    }

    public func displayErrorMessage(error: String) {
        view?.showErrorMessage(with: error)
    }
}
