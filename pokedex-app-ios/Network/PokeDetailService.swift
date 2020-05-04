//
//  PokeDetailService.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 25/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

class PokeDetailService {
    private let endpoint = Endpoint()
    private let requester = Requester()
    private let parameter = "pokemon/"
    private let limit = 50
    
    func loadPokeDetails(pokeName: String, onComplete: @escaping (PokeDetail?) -> Void) {
        let parameters = parameter + "\(pokeName)/"
        guard let url = endpoint.createEndpoint(parameters: parameters) else { return }
        let urlRequest = URLRequest(url: url)
        requester.request(url: urlRequest) { (data: Result<Data, Error>) in
            guard let pokeData: PokeDetail = try? data.decoded() else {
                onComplete(nil)
                return
            }
            onComplete(pokeData)
        }
    }
}
