//
//  Pokemon.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    let count: Int
    let next: String
    let pokeItem: [PokeListItem]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case pokeItem = "results"
    }
    
    init(count: Int, next: String, pokeItem: [PokeListItem]) {
        self.count = count
        self.next = next
        self.pokeItem = pokeItem
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let count: Int = try container.decode(Int.self, forKey: .count)
        let next: String = try container.decode(String.self, forKey: .next)
        let pokeItem: [PokeListItem] = try container.decode([PokeListItem].self, forKey: .pokeItem)
        
        self.init(count: count, next: next, pokeItem: pokeItem)
    }
}
