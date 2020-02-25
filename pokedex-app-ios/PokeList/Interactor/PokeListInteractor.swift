//
//  PokeListInteractor.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

protocol PokeListInteractorDelegate: class {
    func didLoadPokeList(pokemon: Pokemon)
}

class PokeListInteractor {
    
    private let service = PokeListService()
    
    weak var delegate: PokeListInteractorDelegate?
    
    func loadPokemons(page: Int) {
        service.loadPokemons(page: page) { (pokeData) in
            guard let pokemon = pokeData else {return}
            self.delegate?.didLoadPokeList(pokemon: pokemon)
        }
    }
}
