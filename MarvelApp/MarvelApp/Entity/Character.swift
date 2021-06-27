//
//  Character.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import Foundation

struct MarvelResponse: Decodable {
    let copyright: String?
    let attributionText: String?
    let data: CharacterData
}

struct CharacterData: Decodable {
    let offset: Int?
    let limit: Int?
    let results: [Character]
}

struct Character: Decodable {
    let id: String?
    let name: String?
    let description: String?
    let thumbnail: CharacterThumbnail?
}

struct CharacterThumbnail: Decodable {
    let path: String?
    let type: String?

    private enum CodingKeys: String, CodingKey {
        case path, type = "extension"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }
}
