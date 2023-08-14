//
//  FilmResource.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/13/23.
//

struct FilmResource: APIResource {
    typealias ModelType = Film
    var id: Int

    var methodPath: String {
        return "/api/films/\(id)/"
    }

    var page: String? {
        return nil
    }

    var search: String? {
        return nil
    }
}
