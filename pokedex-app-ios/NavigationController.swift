//
//  NavigationBar.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
    func setupNavigation() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = UIColor.init(displayP3Red: 254/255.0, green: 202/255.0, blue: 27/255.0, alpha: 1)
        
        navigationBarAppearance.barTintColor = UIColor.init(displayP3Red: 239/255.0, green: 83/255.0, blue: 80/255.0, alpha: 1)
        
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(displayP3Red: 254/255.0, green: 202/255.0, blue: 27/255.0, alpha: 1)]
    }
}
