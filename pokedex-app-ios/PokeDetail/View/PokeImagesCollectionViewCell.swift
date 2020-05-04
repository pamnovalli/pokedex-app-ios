//
//  PokeImagesCollectionViewCell.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 25/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit
import Kingfisher

class PokeImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imgPokemon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareForReuse(with pokeImage: String) {
        guard let image = URL(string: pokeImage) else { return }
        imgPokemon.kf.setImage(with: image)
    }
}
