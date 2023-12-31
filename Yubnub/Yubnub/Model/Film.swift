//
//  Film.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/13/23.
//

import Foundation

/// An individual `Film` entry per the API schema
struct Film {
    /// The title of this film
    let title: String
    /// The episode number of this film.
    let episodeID: Int
    /// The opening paragraphs at the beginning of this film.
    let openingCrawl: String
    /// The name of the director of this film.
    let director: String
    /// The name(s) of the producer(s) of this film. Comma separated.
    let producer: String
    /// The ISO 8601 date format of film release at original creator country.
    let releaseDate: String
    /// An array of people resource URLs that are in this film.
    let characters: [String]
    /// An array of planet resource URLs that are in this film.
    let planets: [String]
    /// An array of starship resource URLs that are in this film.
    let starships: [String]
    /// An array of vehicle resource URLs that are in this film.
    let vehicles: [String]
    /// An array of species resource URLs that are in this film.
    let species: [String]
    /// the hypermedia URL of this resource.
    let url: String

    func empty() -> Self {
        return Film(title: "test title",
                    episodeID: 99,
                    openingCrawl: "test openingCrawl",
                    director: "test director",
                    producer: "test producer",
                    releaseDate: "test releaseDate",
                    characters: ["test characters"],
                    planets: ["test planets"],
                    starships: ["test starships"],
                    vehicles: ["test vehicles"],
                    species: ["test species"],
                    url: "test url")
    }
}

extension Film: Decodable {
    enum CodingKeys: String, CodingKey {
        case title, director, producer, characters, planets, starships, vehicles, species, url
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case releaseDate = "release_date"
    }
}

extension Film: SwapiRecord {
    var name: String {
        self.title
    }
}

extension Film: Hashable { }
extension Film: Identifiable {
    /// id is determined by the url where it was found at (e.g. https://swapi.dev/api/people/1/ would be "1")
    var id: Int {
        let components = url.components(separatedBy: "/")
        let trimmed = components.dropLast(1)
        return Int(trimmed.last ?? "nil") ?? -1
    }
}

/// A wrapper when requesting multiple `Film`s that also includes pagination data
struct FilmsWrapper: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Film]

    var nextPage: Int? {
        guard let next = next else { return nil }
        let components = URLComponents(string: next)
        let queryItems = components?.queryItems
        let query = queryItems?.first(where: { $0.name == "page" })
        return Int(query?.value ?? "")
    }
}
