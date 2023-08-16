//
//  SingleSpeciesResource.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/13/23.
//

struct SingleSpeciesResource: APIResource {
    typealias ModelType = Species
    var id: Int

    var methodPath: String {
        return "/api/species/\(id)/"
    }

    var page: String? {
        return nil
    }

    var search: String? {
        return nil
    }
}
