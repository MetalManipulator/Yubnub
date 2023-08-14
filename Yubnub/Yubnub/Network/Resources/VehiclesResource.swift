//
//  VehiclesResource.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/13/23.
//

struct VehiclesResource: APIResource {
    typealias ModelType = VehiclesWrapper
    var pageNumber: Int?
    var searchString: String?

    var methodPath: String {
        return "/api/vehicles/"
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
