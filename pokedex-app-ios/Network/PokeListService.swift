//
//  PokeListService.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

class PokeListService {
    
    private let endpoint = Endpoint()
    private let requester = APiRequester()
    private let parameter = "pokemon/"
    private let limit = 50

    
    func loadPokemons(page: Int, onComplete: @escaping (Pokemon?) -> Void) {
        let offset = page * limit
        let parameters = parameter + "?limit=\(limit)&offset=\(offset)"
        let url = endpoint.createEndpoint(parameters: parameters)
        requester.request(url: url) { (data: Result<Data, Error>) in
            guard let pokeData: Pokemon = try? data.decoded() else {
                onComplete(nil)
                return
            }
            onComplete(pokeData)
        }
    }
    
}



