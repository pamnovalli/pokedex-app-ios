//
//  PokeListViewController.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

class PokeListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let presenter = PokeListPresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        presenter.loadPokemons()
        presenter.delegate = self
        tableView.register(UINib(nibName: "PokeItemTableViewCell", bundle: nil), forCellReuseIdentifier: "PokeItemTableViewCell")
        
    }
    
}

extension PokeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.pokeListItems.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokeItemTableViewCell", for: indexPath) as! PokeItemTableViewCell
        let pokeItem = presenter.pokeListItems[indexPath.row]
        cell.prepareForReuse(with: pokeItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == presenter.pokeListItems.count - 10 && !presenter.loadingPokemons && presenter.pokeListItems.count != presenter.total {
            presenter.currentPage += 1
            presenter.loadPokemons()
        }
    }
    
}


extension PokeListViewController: UITableViewDelegate {
    
    
}

extension PokeListViewController: PokeListPresenterProtocol {
    func didLoadpokeList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
