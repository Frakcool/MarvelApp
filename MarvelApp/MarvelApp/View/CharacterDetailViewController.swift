//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 27/06/21.
//

/* import UIKit

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
    var characterImage = UIImageView()
    var nameLabel = UILabel()
    var descriptionLabel = UILabel()
    var copyrightLabel = UILabel()

    var character: Character!

    var presenter: AnyPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addComponents()
    }

    private func addComponents() {
        nameLabel.text = character.name

        if let characterDescription = character.description {
            let desc = characterDescription.isEmpty ? "<No description available>" : characterDescription
            descriptionLabel.text = desc
            descriptionLabel.numberOfLines = 0
            descriptionLabel.lineBreakMode = .byWordWrapping
            descriptionLabel.textAlignment = .justified
        }

        copyrightLabel.text = "Copyright"

        view.addSubview(characterImage)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(copyrightLabel)

        characterImage.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false

        let layout = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            characterImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImage.heightAnchor.constraint(equalToConstant: 180), // Amazing
            characterImage.widthAnchor.constraint(equalToConstant: 180), // Amazing
            characterImage.topAnchor.constraint(equalTo: layout.topAnchor, constant: 20),

            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 20),

            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),

            copyrightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            copyrightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            copyrightLabel.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: -20)
        ])
    }
}

extension CharacterDetailViewController: AnyView {
    func update(with characters: MarvelResponse) {

    }

    func update(with error: String) {
        print("Error")
    }

    func update(with image: UIImage) {
        characterImage.image = image
    }
}
*/ 
