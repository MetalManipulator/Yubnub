//
//  ParsingTests.swift
//  YubnubTests
//
//  Created by Levi Gustin on 7/29/23.
//

import XCTest
@testable import Yubnub

final class ParsingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOpenPeople() throws {
        let peopleWrapper = TestData.People

        // Test simple mapping of keys to types
        XCTAssertEqual(peopleWrapper?.count, 82)
        XCTAssertEqual(peopleWrapper?.next, "https://swapi.dev/api/people/?page=2")
        XCTAssertNil(peopleWrapper?.previous)

        XCTAssertEqual(peopleWrapper?.results[0].name, "Luke Skywalker")
        XCTAssertEqual(peopleWrapper?.results[0].height, "172")
        XCTAssertEqual(peopleWrapper?.results[0].mass, "77")
        XCTAssertEqual(peopleWrapper?.results[0].hairColor, "blond")
        XCTAssertEqual(peopleWrapper?.results[0].skinColor, "fair")
        XCTAssertEqual(peopleWrapper?.results[0].eyeColor, "blue")
        XCTAssertEqual(peopleWrapper?.results[0].birthYear, "19BBY")
        XCTAssertEqual(peopleWrapper?.results[0].gender, "male")
        XCTAssertEqual(peopleWrapper?.results[0].url, "https://swapi.dev/api/people/1/")

        // Test computed vars
        XCTAssertEqual(peopleWrapper?.nextPage, 2)
        XCTAssertEqual(peopleWrapper?.results[0].id, 1)
    }
}
