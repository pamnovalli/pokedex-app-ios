//
//  PokeListInteractor.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

protocol PokeListInteractorDelegate: AnyObject {
    func didLoadPokeList(pokemon: Pokemon)
}

protocol PokeListInteractorProtocol: AnyObject {
    func loadPokemons(page: Int)
}

class PokeListInteractor: PokeListInteractorProtocol {
    private let service: PokeListService
    private weak var delegate: PokeListInteractorDelegate?
    
    init(service: PokeListService = PokeListService(),
        delegate: PokeListInteractorDelegate
    ) {
        self.service = service
        self.delegate = delegate
    }
    
    func loadPokemons(page: Int) {
        service.loadPokemons(page: page) { (pokeData) in
            guard let pokemon = pokeData else {return}
            self.delegate?.didLoadPokeList(pokemon: pokemon)
        }
    }
}
