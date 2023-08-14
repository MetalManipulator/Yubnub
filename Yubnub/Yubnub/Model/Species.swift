//
//  Species.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/13/23.
//

import Foundation

/// An individual `Species` entry per the API schema
struct Species {
    /// The name of this species.
    let name: String
    /// The classification of this species, such as "mammal" or "reptile".
    let classification: String
    /// The designation of this species, such as "sentient".
    let designation: String
    /// The average height of this species in centimeters.
    let averageHeight: String
    /// A comma-separated string of common skin colors for this species,
    /// "none" if this species does not typically have skin.
    let skinColors: String
    /// A comma-separated string of common hair colors for this species,
    /// "none" if this species does not typically have hair.
    let hairColors: String
    /// A comma-separated string of common eye colors for this species,
    /// "none" if this species does not typically have eyes.
    let eyeColors: String
    /// The average lifespan of this species in years.
    let averageLifespan: String
    /// The URL of a planet resource, a planet that this species originates from.
    let homeworld: String
    /// The language commonly spoken by this species.
    let language: String
    /// An array of People URL Resources that are a part of this species.
    let people: [String]
    /// An array of Film URL Resources that this species has appeared in.
    let films: [String]
    /// the hypermedia URL of this resource.
    let url: String

    func empty() -> Self {
        return Species(name: "test name",
                       classification: "test classification",
                       designation: "test designation",
                       averageHeight: "test averageHeight",
                       skinColors: "test skinColors",
                       hairColors: "test hairColors",
                       eyeColors: "test eyeColors",
                       averageLifespan: "test averageLifespan",
                       homeworld: "test homeworld",
                       language: "test language",
                       people: ["test people"],
                       films: ["test films"],
                       url: "test url")
    }
}

extension Species: Decodable {
    enum CodingKeys: String, CodingKey {
        case name, classification, designation, homeworld, language, people, films, url
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
    }
}

extension Species: Identifiable {
    /// id is determined by the url where it was found at (e.g. https://swapi.dev/api/species/1/ would be "1")
    var id: Int {
        let components = url.components(separatedBy: "/")
        let trimmed = components.dropLast(1)
        return Int(trimmed.last ?? "nil") ?? -1
    }
}

/// A wrapper when requesting multiple `Species` that also includes pagination data
struct SpeciesWrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Species]

    var nextPage: Int? {
        guard let next = next else { return nil }
        let components = URLComponents(string: next)
        let queryItems = components?.queryItems
        let query = queryItems?.first(where: { $0.name == "page" })
        return Int(query?.value ?? "")
    }
}
