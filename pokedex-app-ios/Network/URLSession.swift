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
    func decoded<T: Decodable>(using decoder: JSONDecoder = .init())
        throws -> T {
        let data = try get()
        return try decoder.decode(T.self, from: data)
    }
}

extension URLSession: URLSessionRequestable {}

protocol URLSessionRequestable: AnyObject {
    func request(
        url: URLRequest,
        onComplete: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionDataTask
}

extension URLSessionRequestable {
    func request(
        url: URLRequest,
        onComplete: @escaping (Result<Data, Error>) -> Void)
        -> URLSessionDataTask {
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                onComplete(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            switch response.statusCode {
            case 200:
                if let data = data  {
                    onComplete(.success(data))
                }
            default:
                guard let error = error else { return }
                onComplete(.failure(error))
            }
        }
        
        dataTask.resume()
        return dataTask
    }
}
