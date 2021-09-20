//
//  Character.swift
//  Data
//
//  Created by Jesús Sánchez on 06/09/21.
//

import Foundation

@objc public class MarvelCharacter: NSObject {
    @objc public let id: String
    @objc public let name: String
    @objc public let characterDescription: String
    @objc public let thumbnail: Thumbnail

    public init(id: String, name: String, description: String, thumbnail: Thumbnail) {
        self.id = id
        self.name = name
        self.characterDescription = description
        self.thumbnail = thumbnail
    }
}

@objc public class Thumbnail: NSObject {
    @objc public let path: String
    @objc public let type: String

    public init(path: String, type: String) {
        self.path = path
        self.type = type
    }
}
