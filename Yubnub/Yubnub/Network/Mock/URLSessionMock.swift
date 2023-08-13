//
//  URLSessionMock.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/12/23.
//

import Foundation

class URLSessionMock {
    enum ResponseType {
        case success
        case failNotFound
    }
    private var successfulURLs: [URL?: Data] = {
        [URL(string: "https://swapi.dev/api/people/?page=1"): TestData.PeopleRawData]
    }()

    private var failureURLs: [URL?: Data] = {
        [URL(string: "https://swapi.dev/api/people/?page=1"): TestData.NotFound]
    }()

    var session: URLSession

    init(type: ResponseType) {
        switch type {
        case .success:
            URLProtocolStub.testURLs = successfulURLs
        case .failNotFound:
            URLProtocolStub.testURLs = failureURLs
        }

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolStub.self]

        session = URLSession(configuration: config)
    }
}
