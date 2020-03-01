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
    
    let presenter = PokeDetailPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        presenter.loadPokeDetail()
        collectionView.register(UINib(nibName: "PokeImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PokeImagesCollectionViewCell")
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
        self.collectionView.reloadData()
        }
    }
}


extension PokeDetailViewController: UICollectionViewDelegate {

}
