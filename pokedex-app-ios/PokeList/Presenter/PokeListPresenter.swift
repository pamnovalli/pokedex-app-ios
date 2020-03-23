//
//  PokeListPresenter.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation
import UIKit


protocol PokeListPresenterProtocol {
    func didLoadPokeList()
}

class PokeListPresenter {
    
    var interactor = PokeListInteractor()
    var router = PokeListRouter()
    var pokemon: Pokemon?
    var pokeListItems: [PokeListItem] = []
    var delegate: PokeListPresenterProtocol?
    var currentPage = 0
    var total = 0

    init() {
        self.setup()
    }
    
    private func setup() {
        self.interactor.delegate = self
        self.router.delegate = self
    }
    
    func loadPokemons() {
        interactor.loadPokemons(page: currentPage)
    }
    
    func didSelectPokemon(at indexPath: IndexPath) {
        
        guard let pokeListViewController = delegate as? UIViewController else {
            return
        }
        
        let pokemon = pokeListItems[indexPath.row]
        router.navigateToPokeDetail(viewController: pokeListViewController, pokemon: pokemon)
    }
    
}

extension PokeListPresenter: PokeListInteractorDelegate {
    
    func didLoadPokeList(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.pokeListItems += pokemon.pokeItem
        self.total = pokemon.count
        self.delegate?.didLoadPokeList() 
    }
    
}

extension PokeListPresenter: PokeListRouterDelegate {
    
}

