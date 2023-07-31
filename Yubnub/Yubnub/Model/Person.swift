//
//  Person.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/27/23.
//

import Foundation

/// An individual `Person` entry per the API schema
struct Person {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let url: String

    static func empty() -> Self {
        return Person(name: "Test Name",
                      height: "test height",
                      mass: "test mass",
                      hairColor: "test hair",
                      skinColor: "test skin",
                      eyeColor: "test eye",
                      birthYear: "test year",
                      gender: "test gender",
                      homeworld: "test homeworld",
                      films: ["test films"],
                      species: ["test species"],
                      vehicles: ["test vehicles"],
                      starships: ["test starships"],
                      url: "test url")
    }
}

extension Person: Decodable {
    enum CodingKeys: String, CodingKey {
        case name, height, mass, gender, homeworld, films, species, vehicles, starships, url
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
    }
}

extension Person: Identifiable {
    /// id is determined by the url where it was found at (e.g. https://swapi.dev/api/people/1/ would be "1")
    var id: Int {
        let components = url.components(separatedBy: "/")
        let trimmed = components.dropLast(1)
        return Int(trimmed.last ?? "nil") ?? -1
    }
}

/// A wrapper when requesting multiple `Person`s that also includes pagination data
struct PeopleWrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Person]

    var nextPage: Int? {
        guard let next = next else { return nil }
        let components = URLComponents(string: next)
        let queryItems = components?.queryItems
        let query = queryItems?.first(where: { $0.name == "page" })
        return Int(query?.value ?? "")
    }
}

struct TestData {
    /// A page of People data loaded in from local file.
    /// Need to drill into `results` in order to find the array of `Person`s.
    static var People: PeopleWrapper? = {
        guard let url = Bundle.main.url(forResource: "People", withExtension: "json") else {
            print("Failed find local JSON")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(PeopleWrapper.self, from: data)
            return decoded
        } catch {
            print(error)
        }
        return nil
    }()
}
