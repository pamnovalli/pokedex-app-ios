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
    @IBOutlet weak var lblAtack: UILabel!
    @IBOutlet weak var lblDefense: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    
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
    
    
    func setupLabel(){
        self.title = self.presenter.pokeDetail?.name.capitalized
        guard let pokemon = self.presenter.pokeDetail else {return}
        self.lblHeight.text = String(pokemon.height)
        self.lblType.text = pokemon.types[0].type.name.capitalized
        for pokemon in pokemon.abilities {
            let label = UILabel()
            label.text = pokemon.ability.name.capitalized
            self.stackAbilities.addArrangedSubview(label)
        }
        self.lblWeight.text = String(pokemon.weight)
        self.lblSpeed.text = String(pokemon.stats[0].baseStat)
        self.lblDefense.text = String(pokemon.stats[3].baseStat)
        self.lblAtack.text = String(pokemon.stats[4].baseStat)
    }
    
    func didLoadPokeDetail() {
        DispatchQueue.main.async{
            self.setupLabel()
            self.collectionView.reloadData()
        }
    }
}


extension PokeDetailViewController: UICollectionViewDelegate {
    
}
