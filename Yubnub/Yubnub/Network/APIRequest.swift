//
//  PeopleRequest.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/27/23.
//

import Foundation

class APIRequest<Resource: APIResource> {
    let resource: Resource

    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
    /// Decodes the provided data into the ModelType of the resource
    /// - Parameter data: `Data` to decode into known type
    /// - Returns: Optional ModelType if successfully decoded
    func decode(_ data: Data) -> Resource.ModelType? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let decoded = try? decoder.decode(Resource.ModelType.self, from: data)
        return decoded
    }

    /// Executes the `Resource`'s url request and provides a completion for the result
    func execute(withCompletion completion: @escaping (Resource.ModelType?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}
