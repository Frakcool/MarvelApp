//
//  CharacterDetailProtocols.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import UIKit

// View -> Presenter
protocol CharacterDetailPresenterProtocol: AnyObject {
    var interactor: CharacterDetailInputInteractorProtocol? { get set }
    var view: CharacterDetailViewProtocol? { get set }
    var router: CharacterDetailRouterProtocol? { get set }

    func viewDidLoad()
}

// Presenter -> View
protocol CharacterDetailViewProtocol: AnyObject {
    func showCharacterDetails(with character: Character)
    func showCharacterImage(with image: UIImage)
}

// Presenter -> Interactor
protocol CharacterDetailInputInteractorProtocol: AnyObject {
    var presenter: CharacterDetailOutputInteractorProtocol? { get set }

    func getImage(for character: Character)
}

// Interactor -> Presenter
protocol CharacterDetailOutputInteractorProtocol: AnyObject {
    func characterImageDidFetch(image: UIImage)
    func displayErrorMessage(error: String)
}

protocol CharacterDetailRouterProtocol: AnyObject {

}
