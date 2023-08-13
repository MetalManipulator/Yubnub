//
//  NetworkTests.swift
//  YubnubTests
//
//  Created by Levi Gustin on 7/30/23.
//

import XCTest
@testable import Yubnub

final class NetworkTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBuildQuery() throws {
        let peopleResource = PeopleResource()
        let peopleURL = peopleResource.url
        XCTAssertEqual(peopleURL.absoluteString, "https://swapi.dev/api/people/")

        let pageResource = PeopleResource(pageNumber: 2)
        let pageURL = pageResource.url
        XCTAssertEqual(pageURL.absoluteString, "https://swapi.dev/api/people/?page=2")

        let searchResource = PeopleResource(searchString: "R2D2")
        let searchURL = searchResource.url
        XCTAssertEqual(searchURL.absoluteString, "https://swapi.dev/api/people/?search=R2D2")
    }

    func testPeopleRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = PeopleResource(pageNumber: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.count, 82)
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }

    func testPersonRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = PersonResource(id: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.name, "Luke Skywalker")
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }
}
