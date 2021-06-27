//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 27/06/21.
//

import UIKit

// Currently using the Square aspect ratio: https://developer.marvel.com/documentation/images
enum ImageSizes: String {
    case small = "standard_small" // 65 x 45
    case medium = "standard_medium" // 100 x 100
    case large = "standard_large" // 140 x 140
    case xLarge = "standard_xlarge" // 200 x 200
    case fantastic = "standard_fantastic" // 250 x 250
    case amazing = "standard_amazing" // 180 x 180
}

class CharacterDetailViewController: UIViewController {
    var characterImage: UIImageView?
    var characterName: UILabel?
    var characterDescription: UILabel?
    var copyRight: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        addComponents()
    }

    private func addComponents() {
        
    }
}
