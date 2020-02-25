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
    let previous: JSONNull?
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
    
    init(count: Int, next: String, previous: JSONNull?, results: [Result]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let count: Int = try container.decode(Int.self, forKey: .count)
        let next: String = try container.decode(String.self, forKey: .next)
        let previous: JSONNull? = try container.decode(JSONNull?.self, forKey: .previous)
        let results: [Result] = try container.decode([Result].self, forKey: .results)
        
        self.init(count: count, next: next, previous: previous, results: results)
    }
}
