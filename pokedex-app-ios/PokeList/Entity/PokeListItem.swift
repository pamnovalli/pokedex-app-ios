//
//  Result.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct PokeListItem: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
       
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name: String = try container.decode(String.self, forKey: .name)
        let url: String = try container.decode(String.self, forKey: .url)
        
        self.init(name: name, url: url)
        
    }
}
