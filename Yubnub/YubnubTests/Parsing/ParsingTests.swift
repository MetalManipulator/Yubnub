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
        XCTAssertEqual(peopleWrapper?.results.count, 10)

        // Test computed vars
        XCTAssertEqual(peopleWrapper?.nextPage, 2)
    }

    func testOpenPerson() throws {
        let person = TestData.Person

        // Test simple mapping of keys to types
        XCTAssertEqual(person.name, "Luke Skywalker")
        XCTAssertEqual(person.height, "172")
        XCTAssertEqual(person.mass, "77")
        XCTAssertEqual(person.hairColor, "blond")
        XCTAssertEqual(person.skinColor, "fair")
        XCTAssertEqual(person.eyeColor, "blue")
        XCTAssertEqual(person.birthYear, "19BBY")
        XCTAssertEqual(person.gender, "male")
        XCTAssertEqual(person.homeworld, "https://swapi.dev/api/planets/1/")
        XCTAssertEqual(person.films, ["https://swapi.dev/api/films/1/",
                                      "https://swapi.dev/api/films/2/",
                                      "https://swapi.dev/api/films/3/",
                                      "https://swapi.dev/api/films/6/"])
        XCTAssertEqual(person.species, [])
        XCTAssertEqual(person.vehicles, ["https://swapi.dev/api/vehicles/14/",
                                         "https://swapi.dev/api/vehicles/30/"])
        XCTAssertEqual(person.starships, ["https://swapi.dev/api/starships/12/",
                                          "https://swapi.dev/api/starships/22/"])
        XCTAssertEqual(person.url, "https://swapi.dev/api/people/1/")

        // Test computed vars
        XCTAssertEqual(person.id, 1)

        let emptyPerson = TestData.Person.empty()

        XCTAssertEqual(emptyPerson.name, "Test name")
        XCTAssertEqual(emptyPerson.height, "test height")
        XCTAssertEqual(emptyPerson.mass, "test mass")
        XCTAssertEqual(emptyPerson.hairColor, "test hairColor")
        XCTAssertEqual(emptyPerson.skinColor, "test skinColor")
        XCTAssertEqual(emptyPerson.eyeColor, "test eyeColor")
        XCTAssertEqual(emptyPerson.birthYear, "test birthYear")
        XCTAssertEqual(emptyPerson.gender, "test gender")
        XCTAssertEqual(emptyPerson.homeworld, "test homeworld")
        XCTAssertEqual(emptyPerson.films, ["test films"])
        XCTAssertEqual(emptyPerson.species, ["test species"])
        XCTAssertEqual(emptyPerson.vehicles, ["test vehicles"])
        XCTAssertEqual(emptyPerson.starships, ["test starships"])
        XCTAssertEqual(emptyPerson.url, "test url")
    }
}
