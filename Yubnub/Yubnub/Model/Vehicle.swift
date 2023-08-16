//
//  Vehicle.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/13/23.
//

import Foundation

/// An individual `Vehicle` entry per the API schema
struct Vehicle {
    /// The name of this vehicle. The common name, such as "Sand Crawler" or "Speeder bike".
    let name: String
    /// The model or official name of this vehicle. Such as "All-Terrain Attack Transport".
    let model: String
    /// The manufacturer of this vehicle. Comma separated if more than one.
    let manufacturer: String
    /// The cost of this vehicle new, in Galactic Credits.
    let costInCredits: String
    /// The length of this vehicle in meters.
    let length: String
    /// The maximum speed of this vehicle in the atmosphere.
    let maxAtmospheringSpeed: String
    /// The number of personnel needed to run or pilot this vehicle.
    let crew: String
    /// The number of non-essential people this vehicle can transport.
    let passengers: String
    /// The maximum number of kilograms that this vehicle can transport.
    let cargoCapacity: String
    /// The maximum length of time that this vehicle can provide consumables
    /// for its entire crew without having to resupply.
    let consumables: String
    /// The class of this vehicle, such as "Wheeled" or "Repulsorcraft".
    let vehicleClass: String
    /// An array of People URL Resources that this vehicle has been piloted by.
    let pilots: [String]
    /// An array of Film URL Resources that this vehicle has appeared in.
    let films: [String]
    /// the hypermedia URL of this resource.
    let url: String

    func empty() -> Self {
        return Vehicle(name: "test name",
                       model: "test model",
                       manufacturer: "test manufacturer",
                       costInCredits: "test costInCredits",
                       length: "test length",
                       maxAtmospheringSpeed: "test maxAtmospheringSpeed",
                       crew: "test crew",
                       passengers: "test passengers",
                       cargoCapacity: "test cargoCapacity",
                       consumables: "test consumables",
                       vehicleClass: "test vehicleClass",
                       pilots: ["test pilots"],
                       films: ["test films"],
                       url: "test url")
    }
}

extension Vehicle: Decodable {
    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer, length, crew, passengers, consumables, pilots, films, url
        case costInCredits = "cost_in_credits"
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case cargoCapacity = "cargo_capacity"
        case vehicleClass = "vehicle_class"
    }
}

extension Vehicle: Identifiable {
    /// id is determined by the url where it was found at (e.g. https://swapi.dev/api/vehicles/1/ would be "1")
    var id: Int {
        let components = url.components(separatedBy: "/")
        let trimmed = components.dropLast(1)
        return Int(trimmed.last ?? "nil") ?? -1
    }
}

/// A wrapper when requesting multiple `Vehicle`s that also includes pagination data
struct VehiclesWrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Vehicle]

    var nextPage: Int? {
        guard let next = next else { return nil }
        let components = URLComponents(string: next)
        let queryItems = components?.queryItems
        let query = queryItems?.first(where: { $0.name == "page" })
        return Int(query?.value ?? "")
    }
}
