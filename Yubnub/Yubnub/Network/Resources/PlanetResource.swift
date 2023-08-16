//
//  PlanetResource.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/13/23.
//

struct PlanetResource: APIResource {
    typealias ModelType = Planet
    var id: Int

    var methodPath: String {
        return "/api/planets/\(id)/"
    }

    var page: String? {
        return nil
    }

    var search: String? {
        return nil
    }
}
