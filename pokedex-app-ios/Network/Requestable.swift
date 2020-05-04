//
//  Requestable.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 19/04/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

protocol Requestable {
    func request(url: URLRequest, onComplete: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask
}
