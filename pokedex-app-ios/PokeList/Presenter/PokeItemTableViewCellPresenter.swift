//
//  PokeItemTableViewCellPresenter.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 06/09/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

protocol PokeItemTableViewCellProtocol {
    func setPokeName(_ name: String)
}

final class PokeItemTableViewCellPresenter {
    private let pokeItem: PokeListItem
    
    init(pokeItem: PokeListItem) {
        self.pokeItem = pokeItem
    }
    
    func cellDidLoad(_ cell: PokeItemTableViewCellProtocol) {
        cell.setPokeName(pokeItem.name.capitalized)
    }
}
