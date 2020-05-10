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
    private let service: Serviceble
    private weak var delegate: PokeListInteractorDelegate?
    private let limitItens = 50
    
    init(service: Serviceble = Service(),
         delegate: PokeListInteractorDelegate
    ) {
        self.service = service
        self.delegate = delegate
    }
    
    func loadPokemons(page: Int) {
        let offset = page * limitItens
        let parameters = "?limit=\(limitItens)&offset=\(offset)"
        service.loadData(object: Pokemon.self, parameters: parameters) { (pokeList) -> Void in
            self.delegate?.didLoadPokeList(pokemon: pokeList)
        }
    }
}

