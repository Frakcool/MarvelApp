//
//  ErrorUtils.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 09/07/21.
//

import Foundation

struct ErrorUtils {
    static func getError(from error: MarvelError) -> String {
        switch error {
        case .invalidFormat:
            return "Couldn't decode JSON"
        case .networkError:
            return "Couldn't fetch data"
        }
    }
}
