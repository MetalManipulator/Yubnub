//
//  PersonResource.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/27/23.
//

struct PeopleResource: APIResource {
    typealias ModelType = PeopleWrapper
    var pageNumber: Int?
    var searchString: String?

    var methodPath: String {
        return "/api/people/"
    }

    var page: String? {
        guard let pageNumber = pageNumber else {
            return nil
        }

        return "\(pageNumber)"
    }

    var search: String? {
        guard let searchString = searchString else {
            return nil
        }

        return searchString
    }
}
