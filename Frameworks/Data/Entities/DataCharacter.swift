//
//  Character.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import Foundation

public struct MarvelResponse: Decodable {
    public let copyright: String?
    public let attributionText: String?
    public let data: CharacterData?

    private enum CodingKeys: String, CodingKey {
        case copyright, attributionText, data
    }

    public init(copyright: String?, attributionText: String, data: CharacterData?) {
        self.copyright = copyright
        self.attributionText = attributionText
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.attributionText = try container.decodeIfPresent(String.self, forKey: .attributionText)
        self.data = try container.decodeIfPresent(CharacterData.self, forKey: .data)
    }
}

public struct CharacterData: Decodable {
    public let offset: Int?
    public let limit: Int?
    public let results: [DataCharacter]?

    private enum CodingKeys: String, CodingKey {
        case offset, limit, results
    }

    public init(offset: Int?, limit: Int?, results: [DataCharacter]?) {
        self.offset = offset
        self.limit = limit
        self.results = results
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.offset = try container.decodeIfPresent(Int.self, forKey: .offset)
        self.limit = try container.decodeIfPresent(Int.self, forKey: .limit)
        self.results = try container.decodeIfPresent([DataCharacter].self, forKey: .results)
    }
}

public struct DataCharacter: Decodable {
    public let id: String?
    public let name: String?
    public let description: String?
    public let thumbnail: CharacterThumbnail?

    private enum CodingKeys: String, CodingKey {
        case id, name, description, thumbnail
    }

    public init(id: String?, name: String, description: String?, thumbnail: CharacterThumbnail?) {
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.thumbnail = try container.decodeIfPresent(CharacterThumbnail.self, forKey: .thumbnail)
    }
}

public struct CharacterThumbnail: Decodable {
    public let path: String?
    public let type: String?

    private enum CodingKeys: String, CodingKey {
        case path, type = "extension"
    }

    public init(path: String?, type: String?) {
        self.path = path
        self.type = type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }
}
