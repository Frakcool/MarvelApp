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
            return NSLocalizedString("INVALID_FORMAT", comment: "")
        case .networkError:
            return NSLocalizedString("COULD_NOT_FETCH_DATA", comment: "")
        }
    }
}
