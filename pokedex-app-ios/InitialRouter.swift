//
//  InitialRouter.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 23/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

final class InitialRouter {
    private let window: UIWindow
    private let navigator: UINavigationController
    
    init(window: UIWindow = .init(frame: UIScreen.main.bounds),
         navigator: UINavigationController = NavigationController()
    ) {
        self.navigator = navigator
        self.window = window
    }
    
    func start() {
        let router = PokeListRouter(navigator: navigator)
        navigator.viewControllers = [router.makeViewController()]
        window.rootViewController = navigator
        window.makeKeyAndVisible()
    }
}
