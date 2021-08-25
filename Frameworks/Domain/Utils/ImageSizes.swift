//
//  ImageSizes.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import UIKit

// Currently using the Square aspect ratio: https://developer.marvel.com/documentation/images
public enum ImageSizes: Int, CaseIterable {
    case small // 65 x 45
    case medium // 100 x 100
    case large // 140 x 140
    case xLarge // 200 x 200
    case fantastic // 250 x 250
    case amazing // 180 x 180

    public var name: String {
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

    public var size: CGSize {
        switch self {
        case .small:
            return CGSize(width: 65, height: 45)
        case .medium:
            return CGSize(width: 100, height: 100)
        case .large:
            return CGSize(width: 140, height: 140)
        case .xLarge:
            return CGSize(width: 200, height: 200)
        case .fantastic:
            return CGSize(width: 250, height: 250)
        case .amazing:
            return CGSize(width: 180, height: 180)
        }
    }
}
