//
//  PokeListRouter.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation
import UIKit

protocol PokeListRouterDelegate: class  {
    
}

class PokeListRouter {
    
    weak var delegate: PokeListRouterDelegate?
    
    var viewController = PokeListViewController.self
    
    
    func navigateToPokeDetail(viewController: UIViewController, pokemon: PokeListItem){
        let nextViewController = PokeDetailViewController(nibName: "PokeDetailViewController", bundle: Bundle.main)
        nextViewController.presenter.pokemon = pokemon
        viewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
