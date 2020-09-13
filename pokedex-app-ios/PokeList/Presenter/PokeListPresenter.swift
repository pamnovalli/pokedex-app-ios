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

final class PokeListPresenter {
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
        delegate.setTitle("Pokedex")
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
        pokeListItems += pokemon.pokeItem
        total = pokemon.count
        delegate?.setPokeListItems(pokeListItems)
        delegate?.tableViewReloadData()
    }
}
