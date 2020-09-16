//
//  PokeListViewController.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 25/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

final class PokeListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let presenter: PokeListPresenter
    private var pokeListItems: [PokeListItem] = []
    
    init(presenter: PokeListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad(delegate: self)
        tableView.register(UINib(nibName: "PokeItemTableViewCell", bundle: nil), forCellReuseIdentifier: "PokeItemTableViewCell")
    }
}

extension PokeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokeListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokeItemTableViewCell", for: indexPath)
        
        let presenter = PokeItemTableViewCellPresenter(pokeItem: pokeListItems[indexPath.row])
        
        (cell as? PokeItemTableViewCell)?.load(presenter: presenter)
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter.tableViewDidWillDisplay(indexPath: indexPath.row)
    }
}

extension PokeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectPokemon(at: indexPath.row)
    }
}

extension PokeListViewController: PokeListPresenterDelegate {
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func setPokeListItems(_ itens: [PokeListItem]) {
        pokeListItems = itens
    }
    
    func tableViewReloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
