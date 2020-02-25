//
//  Endpoint.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

class Endpoint {
    
    let baseUrl = "https://pokeapi.co/api/v2/"
    
    func createEndpoint(parameters: String) -> URL {
        let url = URL(string: baseUrl + parameters)!
        return url
    }

    
}
