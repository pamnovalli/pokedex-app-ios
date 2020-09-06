//
//  PokeDetailPresenter.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 25/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

protocol PokeDetailPresenterDelegate: AnyObject {
    func setTitle(_ pokeName: String)
    func setHeight(_ height: String)
    func setWeight(_ weight: String)
    func setType(_ type: String)
    func setSpeed(_ speed: String)
    func setDefence(_ defence: String)
    func setAttack(_ attack: String)
    func setAbilities(_ abilities: [String])
    func setImage(_ imageUrl: URL)
    func setStatsViewCornerRadius()
}

protocol PokeDetailPresentable: AnyObject {
    func viewDidLoad(delegate: PokeDetailPresenterDelegate)
}

class PokeDetailPresenter: PokeDetailPresentable {
    private let interactor: PokeDetailInteractorProtocol
    private let router: Routerable
    private var pokemon: PokeListItem?
    private weak var delegate: PokeDetailPresenterDelegate?
    
    init(
        router: PokeDetailRouter,
        pokemon: PokeListItem,
        interactor: PokeDetailInteractorProtocol = PokeDetailInteractor()
    ) {
        self.router = router
        self.pokemon = pokemon
        self.interactor = interactor
    }
    
    func viewDidLoad(delegate: PokeDetailPresenterDelegate) {
        self.delegate = delegate
        
        interactor.setDelegate(delegate: self)
    
        if let pokemon = pokemon {
            interactor.loadPokeDetails(pokeName: pokemon.name)
        }
    }
}

extension PokeDetailPresenter: PokeDetailInteractorDelegate {
    func didLoadPokeDetail(pokemon: PokeDetail) {
        DispatchQueue.main.async {
            var abilities = [String]()
            for pokemon in pokemon.abilities {
                abilities.append(pokemon.ability.name.capitalized)
            }
            self.delegate?.setTitle(pokemon.name.capitalized)
            self.delegate?.setHeight(String(pokemon.height))
            self.delegate?.setType(pokemon.types[0].type.name.capitalized)
            self.delegate?.setWeight(String(pokemon.weight))
            self.delegate?.setSpeed(String(pokemon.stats[0].baseStat))
            self.delegate?.setDefence(String(pokemon.stats[3].baseStat))
            self.delegate?.setAttack(String(pokemon.stats[4].baseStat))
            self.delegate?.setAbilities(abilities)
            guard let url = URL(string: pokemon.sprites.other.officialArtwork.frontDefault) else {
                return
            }
            self.delegate?.setImage(url)
            self.delegate?.setStatsViewCornerRadius()
        }
    }
}
