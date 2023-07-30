//
//  APIResource.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/27/23.
//

import Foundation

protocol APIResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
    var page: String? { get }
    var search: String? { get }
}

extension APIResource {
    var url: URL {
        var components = URLComponents(string: "https://swapi.dev")
        components?.path = methodPath
        if let page = page {
            components?.queryItems?.append(URLQueryItem(name: "pageSize", value: page))
        }
        if let search = search {
            components?.queryItems?.append(URLQueryItem(name: "search", value: search))
        }

        guard let url = components?.url else {
            print("Dev error: could not create url for APIResource")
            return URL(string: "error")!
        }
        return url
    }
}
