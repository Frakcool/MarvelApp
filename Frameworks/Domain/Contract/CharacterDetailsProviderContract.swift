//
//  CharacterDetailsProviderContract.swift
//  Domain
//
//  Created by Jesús Sánchez on 12/10/21.
//

import Foundation

public typealias CharacterImageCompletion = (_ result: Result<Data, MarvelError>) -> Void

public protocol CharacterDetailsProviderContract {
    func imageData(url: String, completion: @escaping CharacterImageCompletion)
}
