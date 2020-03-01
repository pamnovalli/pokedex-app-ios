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
    var task: URLSessionDataTask?
    
    func loadPokeDetails(pokeName: String) {
        task = service.loadPokeDetails(pokeName: pokeName) { (pokeDetailData) in
            guard let pokeDetail = pokeDetailData else {return}
            self.delegate?.didLoadPokeDetail(pokeDetail: pokeDetail)
        }
    }
    
    func cancelTask() {
        task?.cancel()
        task = nil
    }
    
}
