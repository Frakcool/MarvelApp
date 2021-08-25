//
//  HomeProtocols.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import UIKit

public typealias EntryPoint = HomeViewProtocol & UIViewController

// Presenter -> View
public protocol HomeViewProtocol: AnyObject {
    func showCharacters(with characters: [Character])
    func showErrorMessage(with error: String)
}

// View -> Presenter
public protocol HomePresenterProtocol: AnyObject {
    var interactor: HomeInputInteractorProtocol? { get set }
    var view: HomeViewProtocol? { get set }
    var router: HomeRouterProtocol? { get set }

    func getNextCharacters(_ offset: Int)
    func showCharacterDetail(of character: Character, from view: UIViewController)
}

// Presenter -> Interactor
public protocol HomeInputInteractorProtocol: AnyObject {
    var presenter: HomeOutputInteractorProtocol? { get set }

    func getCharactersList(with offset: Int)
}

// Interactor -> Presenter
public protocol HomeOutputInteractorProtocol: AnyObject {
    func charactersListDidFetch(characters: [Character])
    func displayErrorMessage(_ error: String)
}

// Presenter -> Router
public protocol HomeRouterProtocol: AnyObject {
    var entry: EntryPoint? { get }

    func displayCharacterDetails(with character: Character, from view: UIViewController)
    static func start() -> HomeRouterProtocol
}
