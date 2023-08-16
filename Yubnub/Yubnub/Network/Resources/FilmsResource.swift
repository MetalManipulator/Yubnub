//
//  FilmsResource.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/13/23.
//

struct FilmsResource: APIResource {
    typealias ModelType = FilmsWrapper
    var pageNumber: Int?
    var searchString: String?

    var methodPath: String {
        return "/api/films/"
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
