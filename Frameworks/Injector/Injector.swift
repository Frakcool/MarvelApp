//
//  Injector.swift
//  Data
//
//  Created by Jesús Sánchez on 03/10/21.
//

import Data
import Domain

public final class Injector {
    public static var charactersUseCase: CharactersUseCase {
        CharactersUseCase(CharacterProvider())
    }

    public static var characterDetailsUseCase: CharacterDetailsUseCase {
        CharacterDetailsUseCase(CharacterDetailsProvider())
    }
}
