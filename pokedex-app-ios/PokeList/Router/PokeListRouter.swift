//
//  PokeListRouter.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation
import UIKit

protocol PokeListRoutering: AnyObject {
     func navigateToPokeDetail(pokemon: PokeListItem)
}

class PokeListRouter: Routerable, PokeListRoutering {
    var navigator: UINavigationController
    
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func navigateToPokeDetail(pokemon: PokeListItem) {
        let router = PokeDetailRouter(navigator: navigator, pokemon: pokemon)
        let viewController = router.makeViewController()
        navigator.pushViewController(viewController, animated: true)
    }
    
    func makeViewController() -> UIViewController {
        let presenter = PokeListPresenter(router: self)
        
        return PokeListViewController(presenter: presenter)
    }
}

