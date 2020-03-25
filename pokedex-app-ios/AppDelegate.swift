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
    
    private var router: InitialRouter?
    private var navigation = NavigationBar()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        navigation.setupNavigation()
        router = InitialRouter(window: .init(), navigator: .init())
        router?.start()
        return true
    }

}

