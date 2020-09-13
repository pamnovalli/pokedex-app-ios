//
//  PokeDetailRouter.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 03/05/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

final class PokeDetailRouter: Routerable {
    let pokemon: PokeListItem
    var navigator: UINavigationController
    
    init(navigator: UINavigationController, pokemon: PokeListItem) {
        self.navigator = navigator
        self.pokemon = pokemon
    }
    
    func makeViewController() -> UIViewController {
        let presenter = PokeDetailPresenter(router: self, pokemon: pokemon)
        
        return PokeDetailViewController(presenter: presenter)
    }
}
