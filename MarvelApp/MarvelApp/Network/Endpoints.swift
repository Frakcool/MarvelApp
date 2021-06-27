//
//  Endpoints.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 26/06/21.
//

import Foundation
import Moya

enum Endpoints {
    case listCharacters
    case listNextCharacters(offset: Int, limit: Int)
    case getCharacter(characterId: String)
}

extension Endpoints: TargetType {
    var baseURL: URL {
        guard let urlString = Bundle.main.infoDictionary?["Base_URL"] as? String else {
            fatalError()
        }
        return URL(string: urlString)!
    }

    var path: String {
        switch self {
        case .listCharacters, .listNextCharacters(_, _):
            return "/v1/public/characters"
        case .getCharacter(let characterId):
            return "/v1/public/characters/\(characterId)"
        }
    }

    var method: Moya.Method {
        return Method.get
    }

    var sampleData: Data {
        switch self {
        case .listCharacters, .listNextCharacters(_, _):
            return "{\"copyright\":\"© 2021 MARVEL\",\"attributionText\":\"Data provided by Marvel. © 2021 MARVEL\",\"data\":{\"offset\":0,\"limit\":1,\"results\":[{\"id\":1011334,\"name\":\"3-D Man\",\"description\":\"\",\"thumbnail\":{\"path\":\"http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784\",\"extension\":\"jpg\"}}]}}".utf8Encoded
        case .getCharacter(_):
            return "{\"copyright\":\"© 2021 MARVEL\",\"attributionText\":\"Data provided by Marvel. © 2021 MARVEL\",\"data\":{\"offset\":0,\"limit\":20,\"results\":[{\"id\":1009664,\"name\":\"Thor\",\"description\":\"As the Norse God of thunder and lightning, Thor wields one of the greatest weapons ever made, the enchanted hammer Mjolnir. While others have described Thor as an over-muscled, oafish imbecile, he's quite smart and compassionate.  He's self-assured, and he would never, ever stop fighting for a worthwhile cause.\",\"thumbnail\":{\"path\":\"http://i.annihil.us/u/prod/marvel/i/mg/d/d0/5269657a74350\",\"extension\":\"jpg\"}}]}}".utf8Encoded
        }
    }

    var task: Task {
        switch self {
        case .listNextCharacters(let limit, let offset):
            return .requestParameters(parameters: ["offset": offset,
                                                   "limit": limit],
                                      encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

// MARK: - Helpers
private extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}