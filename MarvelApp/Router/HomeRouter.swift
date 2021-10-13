//
//  HomeRouter.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 12/10/21.
//

import Domain
import Foundation
import Presentation
import UIKit

protocol HomeRouterProtocol {
    func goToDetailViewFrom(view: UIViewController, with character: MarvelCharacter)
}

class HomeRouter: HomeRouterProtocol {
    func goToDetailViewFrom(view: UIViewController, with character: MarvelCharacter) {
        let detailsVC = CharacterDetailViewController()
        detailsVC.presenter = CharacterDetailPresenter(view: detailsVC, character: character)

        view.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
