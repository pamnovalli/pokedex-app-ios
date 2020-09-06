//
//  UIImageView+Extensions.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 06/09/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
