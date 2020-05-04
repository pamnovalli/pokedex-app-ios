//
//  AppDelegate.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 23/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private var initialRouter: InitialRouter?
    private var navigation: NavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        navigation = NavigationController()
        navigation?.setupNavigation()
        initialRouter = InitialRouter()
        initialRouter?.start()
        return true
    }

}

