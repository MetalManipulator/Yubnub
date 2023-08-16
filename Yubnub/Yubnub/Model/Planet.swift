//
//  Planet.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/13/23.
//

import Foundation

/// An individual `Planet` entry per the API schema
struct Planet {
    /// The name of this planet.
    let name: String
    /// The number of standard hours it takes for this planet to complete a single rotation on its axis.
    let rotationPeriod: String
    /// The number of standard days it takes for this planet to complete a single orbit of its local star.
    let orbitalPeriod: String
    /// The diameter of this planet in kilometers.
    let diameter: String
    /// The climate of this planet. Comma separated if diverse.
    let climate: String
    /// A number denoting the gravity of this planet, where "1" is normal or 1 standard G. "2" is twice or
    /// 2 standard Gs. "0.5" is half or 0.5 standard Gs.
    let gravity: String
    /// The terrain of this planet. Comma separated if diverse.
    let terrain: String
    /// The percentage of the planet surface that is naturally occurring water or bodies of water.
    let surfaceWater: String
    /// The average population of sentient beings inhabiting this planet.
    let population: String
    /// An array of People URL Resources that live on this planet.
    let residents: [String]
    /// An array of Film URL Resources that this planet has appeared in.
    let films: [String]
    /// the hypermedia URL of this resource.
    let url: String

    func empty() -> Self {
        return Planet(name: "test name",
                      rotationPeriod: "test rotationPeriod",
                      orbitalPeriod: "test orbitalPeriod",
                      diameter: "test diameter",
                      climate: "test climate",
                      gravity: "test gravity",
                      terrain: "test terrain",
                      surfaceWater: "test surfaceWater",
                      population: "test population",
                      residents: ["test residents"],
                      films: ["test films"],
                      url: "test url")
    }
}

extension Planet: Decodable {
    enum CodingKeys: String, CodingKey {
        case name, diameter, climate, gravity, terrain, population, residents, films, url
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case surfaceWater = "surface_water"
    }
}

extension Planet: Identifiable {
    /// id is determined by the url where it was found at (e.g. https://swapi.dev/api/planets/1/ would be "1")
    var id: Int {
        let components = url.components(separatedBy: "/")
        let trimmed = components.dropLast(1)
        return Int(trimmed.last ?? "nil") ?? -1
    }
}

/// A wrapper when requesting multiple `Planet`s that also includes pagination data
struct PlanetsWrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Planet]

    var nextPage: Int? {
        guard let next = next else { return nil }
        let components = URLComponents(string: next)
        let queryItems = components?.queryItems
        let query = queryItems?.first(where: { $0.name == "page" })
        return Int(query?.value ?? "")
    }
}
