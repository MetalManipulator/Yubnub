//
//  PersonResource.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/27/23.
//

struct PeopleResource: APIResource {
    typealias ModelType = Person
    var id: Int?
    var pageNumber: String?
    var searchString: String?

    var methodPath: String {
        guard let id = id else {
            return "/people"
        }

        return "/people/\(id)"
    }

    var page: String? {
        guard let pageNumber = pageNumber else {
            return nil
        }

        return pageNumber
    }

    var search: String? {
        guard let searchString = searchString else {
            return nil
        }

        return searchString
    }
}
