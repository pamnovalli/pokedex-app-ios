//
//  ApiRequester.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

enum Result<Success, Error: Swift.Error> {
    case success(Success)
    case failure(Error)
}

extension Result {
    func get() throws -> Success {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
}


extension Result where Success == Data {
    func decoded<T: Decodable>(using decoder: JSONDecoder = .init()) throws -> T {
        let data = try get()
        return try decoder.decode(T.self, from: data)
    }
}

class APiRequester {
    
    
    func request(url: URL, onComplete: @escaping (Result<Data, Error>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if  error != nil {
                onComplete(.failure(error!))
                print("Client error!")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Server error!")
                return
            }
            
            
            if httpResponse.statusCode == 200 {
                guard let data = data else {
                    return
                }
                onComplete(.success(data))
            }
            
        }.resume()
    }
    
}
