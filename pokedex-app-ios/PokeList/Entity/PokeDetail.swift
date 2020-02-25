//
//  PokeDetail.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 25/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct PokeDetail: Decodable {
    let abilities: [Ability]
    let baseExperience: Int
    let forms: [Species]
    let gameIndices: [GameIndex]
    let height: Int
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: [Move]
    let name: String
    let order: Int
    let species: Species
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int
    
    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order, species, sprites, stats, types, weight
    }
    
    
    init(abilities: [Ability], baseExperience: Int, forms: [Species], gameIndices: [GameIndex], height: Int, id: Int, isDefault: Bool,
         locationAreaEncounters: String, moves: [Move], name: String, order: Int, species: Species, sprites: Sprites, stats: [Stat],
         types: [TypeElement], weight: Int) {
        self.abilities = abilities
        self.baseExperience = baseExperience
        self.forms = forms
        self.gameIndices = gameIndices
        self.height = height
        self.id = id
        self.isDefault = isDefault
        self.locationAreaEncounters = locationAreaEncounters
        self.moves = moves
        self.name = name
        self.order = order
        self.species = species
        self.sprites = sprites
        self.stats = stats
        self.types = types
        self.weight = weight
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let abilities: [Ability] = try container.decode([Ability].self, forKey: .abilities)
        let baseExperience: Int = try container.decode(Int.self, forKey: .baseExperience)
        let forms: [Species] = try container.decode([Species].self, forKey: .forms)
        let gameIndices: [GameIndex] = try container.decode([GameIndex].self, forKey: .gameIndices)
        let height: Int = try container.decode(Int.self, forKey: .height)
        let id: Int = try container.decode(Int.self, forKey: .id)
        let isDefault: Bool = try container.decode(Bool.self, forKey: .isDefault)
        let locationAreaEncounters: String = try container.decode(String.self, forKey: .locationAreaEncounters)
        let moves: [Move] = try container.decode([Move].self, forKey: .moves)
        let name: String = try container.decode(String.self, forKey: .name)
        let order: Int = try container.decode(Int.self, forKey: .order)
        let species: Species = try container.decode(Species.self, forKey: .species)
        let sprites: Sprites = try container.decode(Sprites.self, forKey: .sprites)
        let stats: [Stat] = try container.decode([Stat].self, forKey: .stats)
        let types: [TypeElement] = try container.decode([TypeElement].self, forKey: .types)
        let weight: Int = try container.decode(Int.self, forKey: .weight)
        
        self.init(abilities: abilities, baseExperience: baseExperience, forms: forms, gameIndices: gameIndices,
            height: height, id: id, isDefault: isDefault, locationAreaEncounters: locationAreaEncounters, moves: moves, name: name,
            order: order, species: species, sprites: sprites, stats: stats, types: types, weight: weight)
        
    }
    
}
