//
//  InitialRouter.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 23/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

protocol Router {
    var navigator: UINavigationController { get set }
    func start()
}

class InitialRouter: Router {
    
    var navigator: UINavigationController
    var window: UIWindow
    
    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds), navigator: UINavigationController = UINavigationController()) {
        self.navigator = navigator
        self.window = window
    }
    
    func start() {
        navigator = UINavigationController(rootViewController: PokeListViewController(nibName: "PokeListViewController", bundle: Bundle.main))
        window.rootViewController = navigator
        window.makeKeyAndVisible()
    }
    
    
}
