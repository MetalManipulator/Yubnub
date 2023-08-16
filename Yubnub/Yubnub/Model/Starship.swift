//
//  Starship.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/13/23.
//

import Foundation

/// An individual `Starship` entry per the API schema
struct Starship {
    /// The name of this starship. The common name, such as "Death Star".
    let name: String
    /// The model or official name of this starship. Such as "T-65 X-wing" or "DS-1 Orbital Battle Station".
    let model: String
    /// The manufacturer of this starship. Comma separated if more than one.
    let manufacturer: String
    /// The cost of this starship new, in galactic credits.
    let costInCredits: String
    /// The length of this starship in meters.
    let length: String
    /// The maximum speed of this starship in the atmosphere. "N/A" if this starship is incapable of atmospheric flight.
    let maxAtmospheringSpeed: String
    /// DescriptionThe number of personnel needed to run or pilot this starship.
    let crew: String
    /// The number of non-essential people this starship can transport.
    let passengers: String
    /// The maximum number of kilograms that this starship can transport.
    let cargoCapacity: String
    /// The maximum length of time that this starship can provide consumables
    /// for its entire crew without having to resupply.
    let consumables: String
    /// The class of this starships hyperdrive.
    let hyperdriveRating: String
    /// The Maximum number of Megalights this starship can travel in a standard hour.
    /// A "Megalight" is a standard unit of distance and has never been defined before within the Star Wars universe.
    /// This figure is only really useful for measuring the difference in speed of starships.
    /// We can assume it is similar to AU, the distance between our Sun (Sol) and Earth.
    let MGLT: String
    /// The class of this starship, such as "Starfighter" or "Deep Space Mobile Battlestation"
    let starshipClass: String
    /// An array of People URL Resources that this starship has been piloted by.
    let pilots: [String]
    /// An array of Film URL Resources that this starship has appeared in.
    let films: [String]
    /// the hypermedia URL of this resource.
    let url: String

    func empty() -> Self {
        return Starship(name: "test name",
                        model: "test model",
                        manufacturer: "test manufacturer",
                        costInCredits: "test costInCredits",
                        length: "test length",
                        maxAtmospheringSpeed: "test maxAtmospheringSpeed",
                        crew: "test crew",
                        passengers: "test passengers",
                        cargoCapacity: "test cargoCapacity",
                        consumables: "test consumables",
                        hyperdriveRating: "test hyperdriveRating",
                        MGLT: "test MGLT",
                        starshipClass: "test starshipClass",
                        pilots: ["test pilots"],
                        films: ["test films"],
                        url: "test url")
    }
}

extension Starship: Decodable {
    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer, length, crew, passengers, consumables, MGLT, pilots, films, url
        case costInCredits = "cost_in_credits"
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case cargoCapacity = "cargo_capacity"
        case hyperdriveRating = "hyperdrive_rating"
        case starshipClass = "starship_class"
    }
}

extension Starship: Identifiable {
    /// id is determined by the url where it was found at (e.g. https://swapi.dev/api/starships/1/ would be "1")
    var id: Int {
        let components = url.components(separatedBy: "/")
        let trimmed = components.dropLast(1)
        return Int(trimmed.last ?? "nil") ?? -1
    }
}

/// A wrapper when requesting multiple `Starship`s that also includes pagination data
struct StarshipsWrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Starship]

    var nextPage: Int? {
        guard let next = next else { return nil }
        let components = URLComponents(string: next)
        let queryItems = components?.queryItems
        let query = queryItems?.first(where: { $0.name == "page" })
        return Int(query?.value ?? "")
    }
}
