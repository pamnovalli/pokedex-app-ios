//
//  PokeDetailViewController.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 25/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

class PokeDetailViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var lblPokeName: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var stackAbilities: UIStackView!
    
    
    
    let presenter = PokeDetailPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "PokeImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PokeImagesCollectionViewCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.loadPokeDetail()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.cancelTask()
    }

}

extension PokeDetailViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.pokeImages.count
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeImagesCollectionViewCell", for: indexPath) as! PokeImagesCollectionViewCell
        let pokeImages = presenter.pokeImages[indexPath.item]
        
        cell.prepareForReuse(with: pokeImages)
        return cell
    }


}


extension PokeDetailViewController: PokeDetailPresenterProtocol {
    
    func didLoadPokeDetail() {
        DispatchQueue.main.async{
        guard let pokemon = self.presenter.pokeDetail else {return}
        self.lblPokeName.text = self.presenter.pokeDetail?.name.capitalized
        self.lblHeight.text = String(pokemon.height)
        self.lblType.text = pokemon.types[0].type.name.capitalized
            for pokemon in pokemon.abilities {
                let label = UILabel()
                label.text = pokemon.ability.name.capitalized
                self.stackAbilities.addArrangedSubview(label)
            }
        self.lblWeight.text = String(pokemon.weight)
        self.collectionView.reloadData()
        }
    }
}


extension PokeDetailViewController: UICollectionViewDelegate {

}
