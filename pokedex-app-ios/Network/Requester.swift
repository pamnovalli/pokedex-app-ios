//
//  Endpoint.swift
//  pokedex-app-ios
//
//  Created by Pamela Ianovalli on 24/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

protocol Requestable: AnyObject {
   static func makeURLRequest(url: String) -> URLRequest?
}

final class Requester: Requestable {
    static func makeURLRequest(url: String) -> URLRequest? {
        guard let url = URL(string: urlBase + url) else { return nil}
        return URLRequest(url: url)
    }
}
