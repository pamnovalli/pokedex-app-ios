//
//  PokeListPresenter.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

protocol PokeListPresenterDelegate: AnyObject {
    func didLoadPokeList()
}

protocol PokeListPresentable: AnyObject {
     func loadPokemons()
    func didSelectPokemon(at indexPath: Int)
}

class PokeListPresenter: PokeListPresentable {
    private var router: PokeListRoutering
    private var pokemon: Pokemon?
    private lazy var interactor = PokeListInteractor(delegate: self)
    var pokeListItems: [PokeListItem] = []
    weak var delegate: PokeListPresenterDelegate?
    var currentPage = 0
    var total = 0

    init(router: PokeListRoutering) {
        self.router = router
    }
    
    func loadPokemons() {
        interactor.loadPokemons(page: currentPage)
    }
    
    func didSelectPokemon(at indexPath: Int) {
        let pokemon = pokeListItems[indexPath]
        router.navigateToPokeDetail(pokemon: pokemon)
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
