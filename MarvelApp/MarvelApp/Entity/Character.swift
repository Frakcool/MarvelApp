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
    let data: CharacterData?

    private enum CodingKeys: String, CodingKey {
        case copyright, attributionText, data
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.attributionText = try container.decodeIfPresent(String.self, forKey: .attributionText)
        self.data = try container.decodeIfPresent(CharacterData.self, forKey: .data)
    }
}

struct CharacterData: Decodable {
    let offset: Int?
    let limit: Int?
    let results: [Character]?

    private enum CodingKeys: String, CodingKey {
        case offset, limit, results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.offset = try container.decodeIfPresent(Int.self, forKey: .offset)
        self.limit = try container.decodeIfPresent(Int.self, forKey: .limit)
        self.results = try container.decodeIfPresent([Character].self, forKey: .results)
    }
}

struct Character: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: CharacterThumbnail?

    private enum CodingKeys: String, CodingKey {
        case id, name, description, thumbnail
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.thumbnail = try container.decodeIfPresent(CharacterThumbnail.self, forKey: .thumbnail)
    }
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
