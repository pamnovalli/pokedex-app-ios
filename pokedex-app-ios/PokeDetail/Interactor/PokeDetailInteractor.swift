//
//  PokeDetailInteractor.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 25/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

protocol PokeDetailInteractorDelegate: AnyObject {
    func didLoadPokeDetail(pokemon: PokeDetail)
}

protocol PokeDetailInteractorProtocol: AnyObject {
     func loadPokeDetails(pokeName: String)
}

class PokeDetailInteractor: PokeDetailInteractorProtocol {
    private let service: PokeDetailService
    private weak var delegate: PokeDetailInteractorDelegate?
    
    init(service: PokeDetailService = PokeDetailService(),
         delegate: PokeDetailInteractorDelegate
    ) {
        self.service = service
        self.delegate = delegate
    }
    
    func loadPokeDetails(pokeName: String) {
        service.loadPokeDetails(pokeName: pokeName) { (pokeDetailData) in
            guard let pokeDetail = pokeDetailData else {return}
            self.delegate?.didLoadPokeDetail(pokemon: pokeDetail)
        }
    }
}
