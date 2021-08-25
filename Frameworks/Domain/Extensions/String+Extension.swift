//
//  String+Extension.swift
//  MarvelApp
//
//  Created by Jesús Sánchez on 08/08/21.
//

import Foundation
import CryptoKit

// MARK: Encoding
public extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }

    var md5Ciphered: String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
