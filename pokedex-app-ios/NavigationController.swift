//
//  NavigationBar.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/03/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    func setupNavigation(){
        UINavigationBar.appearance().tintColor = UIColor.init(displayP3Red: 254/255.0, green: 202/255.0, blue: 27/255.0, alpha: 1)
        UINavigationBar.appearance().barTintColor = UIColor.init(displayP3Red: 239/255.0, green: 83/255.0, blue: 80/255.0, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.init(displayP3Red: 254/255.0, green: 202/255.0, blue: 27/255.0, alpha: 1)]
    }
    
}
