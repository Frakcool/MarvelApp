//
//  CharacterDetailPresenter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import UIKit

class CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    var interactor: CharacterDetailInputInteractorProtocol?

    var view: CharacterDetailViewProtocol?

    var router: CharacterDetailRouterProtocol?

    var character: Character!
    var image: UIImage?

    func viewDidLoad() {
        view?.showCharacterDetails(with: character)
        interactor?.getImage(for: character)
    }
}

extension CharacterDetailPresenter: CharacterDetailOutputInteractorProtocol {
    func characterImageDidFetch(image: UIImage) {
        view?.showCharacterImage(with: image)
    }

    func displayErrorMessage(error: String) {
        print(error)
    }
}
