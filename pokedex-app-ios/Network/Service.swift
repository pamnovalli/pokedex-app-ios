//
//  Serviceble.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 10/05/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

enum APIServiceError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
}

protocol Serviceble: AnyObject {
    func loadData<T: Decodable>(
        object: T.Type,
        parameters: String,
        onComplete: @escaping (T) -> Void
    ) -> Void
}

final class Service: Serviceble {
    func loadData<T: Decodable>(
        object: T.Type,
        parameters: String,
        onComplete: @escaping (T) -> Void) {
        
        guard let url = Requester.makeURLRequest(url: parameters) else { return }
        URLSession.shared.request(url: url) { result in
            switch result {
            case .success( _):
                do {
                    let pokeData: T = try result.decoded()
                    onComplete(pokeData)
                } catch {
                    print("Decoded error")
                }
            case .failure( _):
                print("Api error")
            }
        }
    }
}
