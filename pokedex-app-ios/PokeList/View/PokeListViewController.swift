//
//  PokeListViewController.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 25/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

class PokeListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let presenter: PokeListPresenter
    
    init(presenter: PokeListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokedex"
        tableView.dataSource = self
        tableView.delegate = self
        presenter.delegate = self
        tableView.register(UINib(nibName: "PokeItemTableViewCell", bundle: nil), forCellReuseIdentifier: "PokeItemTableViewCell")
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if presenter.pokeListItems.isEmpty {
             presenter.loadPokemons()
        }
    }
    
}

extension PokeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.pokeListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokeItemTableViewCell", for: indexPath) as! PokeItemTableViewCell
        let pokeItem = presenter.pokeListItems[indexPath.row]
        cell.fill(with: pokeItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == presenter.pokeListItems.count - 10 &&  presenter.pokeListItems.count != presenter.total {
            presenter.currentPage += 1
            presenter.loadPokemons()
        }
    }
    
}

extension PokeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectPokemon(at: indexPath.row)
    }
}

extension PokeListViewController: PokeListPresenterDelegate {
    func didLoadPokeList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
