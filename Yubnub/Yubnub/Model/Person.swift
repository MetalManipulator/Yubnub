//
//  Person.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/27/23.
//

import Foundation

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
    var id: Int {
        let components = url.components(separatedBy: "/")
        let trimmed = components.dropLast(1)
        return Int(trimmed.last ?? "nil") ?? -1
    }
}

struct PeopleWrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Person]
}

struct TestData {
//    static var Person: Person = {
//        let url = Bundle.main.url(forResource: "Person", withExtension: "json")!
//        let data = try! Data(contentsOf: url)
//        let decoded = try! JSONDecoder().decode(Person.self, from: data)
//        return decoded
//    }()

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
