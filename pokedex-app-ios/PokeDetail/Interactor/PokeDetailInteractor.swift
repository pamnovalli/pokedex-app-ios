//
//  PokeDetailInteractor.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 25/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation


protocol PokeDetailInteractorProtocol {
    func didLoadPokeDetail(pokeDetail: PokeDetail)
}

class PokeDetailInteractor {
    
    let service = PokeDetailService()
    var delegate: PokeDetailInteractorProtocol?
    
    func loadPokeDetails(pokeName: String) {
        service.loadPokeDetails(pokeName: pokeName) { (pokeDetailData) in
            guard let pokeDetail = pokeDetailData else {return}
            self.delegate?.didLoadPokeDetail(pokeDetail: pokeDetail)
        }
    }
    
}
