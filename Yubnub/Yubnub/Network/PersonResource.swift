//
//  PersonResource.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/27/23.
//

struct PersonResource: APIResource {
    typealias ModelType = Person
    var id: Int

    var methodPath: String {
        return "/people/\(id)/"
    }

    var page: String? {
        return nil
    }

    var search: String? {
        return nil
    }
}
