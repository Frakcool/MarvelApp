//
//  Character.swift
//  Data
//
//  Created by Jesús Sánchez on 06/09/21.
//

import Foundation

public struct MarvelCharacter {
    public let id: Int
    public let name: String
    public let characterDescription: String
    public let thumbnail: Thumbnail

    public init(id: Int, name: String, description: String, thumbnail: Thumbnail) {
        self.id = id
        self.name = name
        self.characterDescription = description
        self.thumbnail = thumbnail
    }
}

public struct Thumbnail {
    public let path: String
    public let type: String

    public init(path: String, type: String) {
        self.path = path
        self.type = type
    }
}
