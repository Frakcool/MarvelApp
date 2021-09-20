//
//  MarvelError.swift
//  Data
//
//  Created by Jesús Sánchez on 24/08/21.
//

import Foundation

public enum MarvelError: Error {
    case networkError
    case invalidFormat

    public var localizedError: String {
        switch self {
        case .networkError:
            return NSLocalizedString("COULD_NOT_FETCH_DATA", comment: "")
        case .invalidFormat:
            return NSLocalizedString("INVALID_FORMAT", comment: "")
        }
    }
}
