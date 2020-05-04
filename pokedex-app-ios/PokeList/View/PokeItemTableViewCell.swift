//
//  PokeItemTableViewCell.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit
import Kingfisher

class PokeItemTableViewCell: UITableViewCell {
    
   @IBOutlet private weak var lblPokeItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fill(with item: PokeListItem) {
        lblPokeItem.text = item.name.capitalized
    }
}
