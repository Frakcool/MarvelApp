//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 27/06/21.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    var characterImage = UIImageView()
    var nameLabel = UILabel()
    var descriptionLabel = UILabel()
    var copyrightLabel = UILabel()

    var character: Character!

    var presenter: CharacterDetailPresenterProtocol?

    private enum Constants {
        static let positiveMargin = CGFloat(20)
        static let negativeMargin = CGFloat(-20)
        static let noDescription = NSLocalizedString("NO_DESCRIPTION_AVAILABLE", comment: "")
        static let copyright = "Copyright" // TODO: Use the one from Web Service
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addComponents()
        presenter?.viewDidLoad()
    }

    private func addComponents() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.textAlignment = .justified

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
            characterImage.heightAnchor.constraint(equalToConstant: ImageSizes.amazing.height), // Amazing
            characterImage.widthAnchor.constraint(equalToConstant: ImageSizes.amazing.width), // Amazing
            characterImage.topAnchor.constraint(equalTo: layout.topAnchor, constant: Constants.positiveMargin),

            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor,
                                           constant: Constants.positiveMargin),

            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                      constant: Constants.positiveMargin),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                       constant: Constants.negativeMargin),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,
                                                  constant: Constants.positiveMargin),

            copyrightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                    constant: Constants.positiveMargin),
            copyrightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                     constant: Constants.negativeMargin),
            copyrightLabel.bottomAnchor.constraint(equalTo: layout.bottomAnchor,
                                                   constant: Constants.negativeMargin)
        ])
    }
}

extension CharacterDetailViewController: CharacterDetailViewProtocol {
    func showCharacterDetails(with character: Character) {
        if let characterDescription = character.description {
            let desc = characterDescription.isEmpty ? Constants.noDescription : characterDescription
            descriptionLabel.text = desc
            copyrightLabel.text = Constants.copyright
            nameLabel.text = character.name
        }
    }

    func showCharacterImage(with image: UIImage) {
        characterImage.image = image
    }

    func showErrorMessage(with error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")

                case .cancel:
                print("cancel")

                case .destructive:
                print("destructive")

            @unknown default:
                print("Unknown")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

