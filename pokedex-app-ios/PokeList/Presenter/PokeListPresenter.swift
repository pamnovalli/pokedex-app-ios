//
//  PokeListPresenter.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

protocol PokeListPresenterDelegate: AnyObject {
    func tableViewReloadData()
    func setPokeListItems(_ itens: [PokeListItem])
    func setTitle(_ title: String)
}

protocol PokeListPresentable: AnyObject {
    func didSelectPokemon(at indexPath: Int)
    func tableViewDidWillDisplay(indexPath: Int)
}

class PokeListPresenter: PokeListPresentable {
    private var router: PokeListRoutering
    private var pokemon: Pokemon?
    private lazy var interactor = PokeListInteractor(delegate: self)
    private var pokeListItems: [PokeListItem] = []
    private weak var delegate: PokeListPresenterDelegate?
    private var currentPage = 0
    private var total = 0

    init(router: PokeListRoutering) {
        self.router = router
    }
    
    func viewDidLoad(delegate: PokeListPresenterDelegate) {
        self.delegate = delegate
        interactor.loadPokemons(page: currentPage)
    }
    
    func tableViewDidWillDisplay(indexPath: Int) {
        if indexPath == pokeListItems.count - 10 && pokeListItems.count != total {
            currentPage += 1
            interactor.loadPokemons(page: currentPage)
        }
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
        self.delegate?.tableViewReloadData()
        self.delegate?.setPokeListItems(pokeListItems)
        self.delegate?.setTitle("Pokedex")
    }
}
