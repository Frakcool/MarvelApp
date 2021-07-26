//
//  HomeProtocols.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import UIKit

// Presenter -> View
protocol HomeViewProtocol: AnyObject {
    func showCharacters(with characters: [Character])
    func showErrorMessage(with error: String)
}

// View -> Presenter
protocol HomePresenterProtocol: AnyObject {
    var interactor: HomeInputInteractorProtocol? { get set }
    var view: HomeViewProtocol? { get set }
    var router: HomeRouterProtocol? { get set }

    func getNextCharacters(_ offset: Int)
    func showCharacterDetail(of character: Character, from view: UIViewController)
}

// Presenter -> Interactor
protocol HomeInputInteractorProtocol: AnyObject {
    var presenter: HomeOutputInteractorProtocol? { get set }

    func getCharactersList(with offset: Int)
}

// Interactor -> Presenter
protocol HomeOutputInteractorProtocol: AnyObject {
    func charactersListDidFetch(characters: [Character])
    func displayErrorMessage(_ error: String)
}

// Presenter -> Router
protocol HomeRouterProtocol: AnyObject {
    var entry: EntryPoint? { get }

    func pushToCharacterDetails(with character: Character, from view: UIViewController)
    static func start() -> HomeRouterProtocol
}
