//
//  VehicleResource.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/13/23.
//

struct VehicleResource: APIResource {
    typealias ModelType = Vehicle
    var id: Int

    var methodPath: String {
        return "/api/vehicles/\(id)/"
    }

    var page: String? {
        return nil
    }

    var search: String? {
        return nil
    }
}
