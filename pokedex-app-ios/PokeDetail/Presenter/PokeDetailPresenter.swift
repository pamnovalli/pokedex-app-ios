//
//  PokeDetailPresenter.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 25/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

protocol PokeDetailPresenterProtocol {
    func didLoadPokeDetail()
}


class PokeDetailPresenter {
    
    var pokemon: PokeListItem?
    var delegate: PokeDetailPresenterProtocol?
    let interactor = PokeDetailInteractor()
    var pokeDetail: PokeDetail?
    var pokeImages: [String] = []
    
    init() {
        setup()
    }
    
    private func setup() {
        interactor.delegate = self
        
    }
    
    
    func loadPokeDetail() {
        if let pokemon = pokemon {
            interactor.loadPokeDetails(pokeName: pokemon.name)
        }
    }
    
    func cancelTask() {
        interactor.cancelTask()
    }
}

extension PokeDetailPresenter: PokeDetailInteractorProtocol {
    func didLoadPokeDetail(pokeDetail: PokeDetail) {
        self.pokeDetail = pokeDetail
        self.pokeImages.append(pokeDetail.sprites.frontDefault)
        self.pokeImages.append(pokeDetail.sprites.backDefault)
        self.delegate?.didLoadPokeDetail()
    }
    
}
