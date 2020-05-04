//
//  PokeDetailPresenter.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 25/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation
import UIKit

protocol PokeDetailPresenterDelegate: AnyObject {
    func updatePokeDetail()
    func setTitle(pokeName: String)
    func setHeight(height: String)
    func setWeight(weight: String)
    func setType(type: String)
    func setSpeed(speed: String)
    func setDefence(defence: String)
    func setAttack(attack: String)
    func setAbilities(abilities: [String])
}

protocol PokeDetailPresentable: AnyObject {
    func loadPokeDetail()
}

class PokeDetailPresenter: PokeDetailPresentable {
    private lazy var interactor = PokeDetailInteractor(delegate: self)
    private let router: Routerable
    var pokemon: PokeListItem?
    weak var delegate: PokeDetailPresenterDelegate?
    var pokeImages: [String] = []
    var pokeName: String = ""
    
    init(
        router: PokeDetailRouter,
        pokemon: PokeListItem
    ) {
        self.router = router
        self.pokemon = pokemon
    }
    
    func loadPokeDetail() {
        if let pokemon = pokemon {
            interactor.loadPokeDetails(pokeName: pokemon.name)
        }
    }
}

extension PokeDetailPresenter: PokeDetailInteractorDelegate {
    func didLoadPokeDetail(pokemon: PokeDetail) {
        DispatchQueue.main.async{
            var abilities = [String]()
            for pokemon in pokemon.abilities {
                abilities.append(pokemon.ability.name.capitalized)
            }
            self.delegate?.setTitle(pokeName: pokemon.name.capitalized)
            self.delegate?.setHeight(height: String(pokemon.height))
            self.delegate?.setType(type: pokemon.types[0].type.name.capitalized)
            self.delegate?.setWeight(weight: String(pokemon.weight))
            self.delegate?.setSpeed(speed: String(pokemon.stats[0].baseStat))
            self.delegate?.setDefence(defence: String(pokemon.stats[3].baseStat))
            self.delegate?.setAttack(attack: String(pokemon.stats[4].baseStat))
            self.delegate?.setAbilities(abilities: abilities)
            
            self.pokeImages.append(pokemon.sprites.frontDefault)
            self.pokeImages.append(pokemon.sprites.backDefault)
            self.delegate?.updatePokeDetail()
            
        }
    }
}
