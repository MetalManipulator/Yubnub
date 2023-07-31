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
        let pageResource = PeopleResource(pageNumber: 2)
        let pageURL = pageResource.url
        XCTAssertEqual(pageURL.absoluteString, "https://swapi.dev/api/people/?page=2")

        let searchResource = PeopleResource(searchString: "R2D2")
        let searchURL = searchResource.url
        XCTAssertEqual(searchURL.absoluteString, "https://swapi.dev/api/people/?search=R2D2")
    }
}
