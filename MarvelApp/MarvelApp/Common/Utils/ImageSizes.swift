//
//  ImageSizes.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import Foundation

// Currently using the Square aspect ratio: https://developer.marvel.com/documentation/images
enum ImageSizes: Int, CaseIterable {
    case small // 65 x 45
    case medium // 100 x 100
    case large // 140 x 140
    case xLarge // 200 x 200
    case fantastic // 250 x 250
    case amazing // 180 x 180

    var name: String {
        switch self {
        case .small:
            return "standard_small"
        case .medium:
            return "standard_medium"
        case .large:
            return "standard_large"
        case .xLarge:
            return "standard_xlarge"
        case .fantastic:
            return "standard_fantastic"
        case .amazing:
            return "standard_amazing"
        }
    }

    var width: Int {
        switch self {
        case .small:
            return 65
        case .medium:
            return 100
        case .large:
            return 140
        case .xLarge:
            return 200
        case .fantastic:
            return 250
        case .amazing:
            return 180
        }
    }

    var height: Int {
        switch self {
        case .small:
            return 45
        case .medium:
            return 100
        case .large:
            return 140
        case .xLarge:
            return 200
        case .fantastic:
            return 250
        case .amazing:
            return 180
        }
    }
}
