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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().tintColor = UIColor.yellow
        UINavigationBar.appearance().barTintColor = UIColor.init(displayP3Red: 239/255.0, green: 83/255.0, blue: 80/255.0, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.init(displayP3Red: 254/255.0, green: 202/255.0, blue: 27/255.0, alpha: 1)]
        router = InitialRouter(window: .init(), navigator: .init())
        router?.start()
        return true
    }

}

