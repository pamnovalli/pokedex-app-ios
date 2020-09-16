//
//  PokeItemTableViewCell.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

final class PokeItemTableViewCell: UITableViewCell {
    @IBOutlet private weak var lblPokeItem: UILabel!
    
    func load(presenter: PokeItemTableViewCellPresenter) {
        presenter.cellDidLoad(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension PokeItemTableViewCell: PokeItemTableViewCellProtocol {
    func setPokeName(_ name: String) {
        lblPokeItem.text = name
    }
}
