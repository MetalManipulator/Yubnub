//
//  Person.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/27/23.
//

import Foundation

/// An individual `Person` entry per the API schema
struct Person: SwapiRecord {
    /// The name of this person.
    let name: String
    /// The height of the person in centimeters.
    let height: String
    /// The mass of the person in kilograms.
    let mass: String
    /// The hair color of this person. Will be "unknown" if not known or "n/a" if the person does not have hair.
    let hairColor: String
    /// The skin color of this person.
    let skinColor: String
    /// The eye color of this person. Will be "unknown" if not known or "n/a" if the person does not have an eye.
    let eyeColor: String
    /// The birth year of the person, using the in-universe standard of BBY or ABY - Before the Battle of Yavin or After
    /// the Battle of Yavin. The Battle of Yavin is a battle that occurs at the end of Star Wars episode IV: A New Hope.
    let birthYear: String
    /// The gender of this person. Either "Male", "Female" or "unknown", "n/a" if the person does not have a gender.
    let gender: String
    /// The URL of a planet resource, a planet that this person was born on or inhabits.
    let homeworld: String
    /// An array of film resource URLs that this person has been in.
    let films: [String]
    /// An array of species resource URLs that this person belongs to.
    let species: [String]
    /// An array of vehicle resource URLs that this person has piloted.
    let vehicles: [String]
    /// An array of starship resource URLs that this person has piloted.
    let starships: [String]
    /// the hypermedia URL of this resource.
    let url: String

    func empty() -> Self {
        return Person(name: "Test name",
                      height: "test height",
                      mass: "test mass",
                      hairColor: "test hairColor",
                      skinColor: "test skinColor",
                      eyeColor: "test eyeColor",
                      birthYear: "test birthYear",
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
