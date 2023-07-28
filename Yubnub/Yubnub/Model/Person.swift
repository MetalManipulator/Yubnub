//
//  Person.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/27/23.
//

struct Person {
    let name: String
    let height: Int
    let mass: Int
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

struct Wrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Person]
}
