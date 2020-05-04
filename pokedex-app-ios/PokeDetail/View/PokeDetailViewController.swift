//
//  PokeDetailViewController.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 25/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit 

class PokeDetailViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var lblPokeName: UILabel!
    @IBOutlet private weak var lblHeight: UILabel!
    @IBOutlet private weak var lblType: UILabel!
    @IBOutlet private weak var lblWeight: UILabel!
    @IBOutlet private weak var stackAbilities: UIStackView!
    @IBOutlet private weak var lblAtack: UILabel!
    @IBOutlet private weak var lblDefense: UILabel!
    @IBOutlet private weak var lblSpeed: UILabel!
    
    let presenter: PokeDetailPresenter

    init(presenter: PokeDetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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

extension PokeDetailViewController: PokeDetailPresenterDelegate {

    func setSpeed(speed: String) {
        lblSpeed.text = speed
    }
    
    func setDefence(defence: String) {
        lblDefense.text = defence
    }
    
    func setAttack(attack: String) {
        lblAtack.text = attack
    }
    
    func setHeight(height: String) {
        lblHeight.text = height
    }
    
    func setWeight(weight: String) {
        lblWeight.text = weight
    }
    
    func setType(type: String) {
        lblType.text = type
    }
    
    func setTitle(pokeName: String) {
        self.title = pokeName
    }
    
    func setAbilities(abilities abilitys: [String]) {
        for ability in abilitys {
            let label = UILabel()
            label.text = ability
            self.stackAbilities.addArrangedSubview(label)
        }
    }
    
    func updatePokeDetail() {
        self.collectionView.reloadData()
    }
}

extension PokeDetailViewController: UICollectionViewDelegate {
    
}
