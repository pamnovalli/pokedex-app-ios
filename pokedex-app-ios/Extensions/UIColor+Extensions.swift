//
//  UIColor+Extension.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 06/09/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

extension UIColor {
  static func random () -> UIColor {
    return UIColor(
      red: CGFloat.random(in: 0...1),
      green: CGFloat.random(in: 0...1),
      blue: CGFloat.random(in: 0...1),
      alpha: 1.0)
  }
}
