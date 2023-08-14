//
//  StarshipResource.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/13/23.
//

struct StarshipResource: APIResource {
    typealias ModelType = Starship
    var id: Int

    var methodPath: String {
        return "/api/starships/\(id)/"
    }

    var page: String? {
        return nil
    }

    var search: String? {
        return nil
    }
}
