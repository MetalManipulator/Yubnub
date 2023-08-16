//
//  URLSessionMock.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/12/23.
//

import Foundation

class URLSessionMock {
    enum ResponseType {
        case success
        case failNotFound
    }

    private var filmURL = URL(string: "https://swapi.dev/api/films/1/")
    private var filmsURL = URL(string: "https://swapi.dev/api/films/?page=1")
    private var personURL = URL(string: "https://swapi.dev/api/people/1/")
    private var peopleURL = URL(string: "https://swapi.dev/api/people/?page=1")
    private var planetURL = URL(string: "https://swapi.dev/api/planets/1/")
    private var planetsURL = URL(string: "https://swapi.dev/api/planets/?page=1")
    private var singleSpeciesURL = URL(string: "https://swapi.dev/api/species/1/")
    private var speciesURL = URL(string: "https://swapi.dev/api/species/?page=1")
    private var starshipURL = URL(string: "https://swapi.dev/api/starships/2/")
    private var starshipsURL = URL(string: "https://swapi.dev/api/starships/?page=1")
    private var vehicleURL = URL(string: "https://swapi.dev/api/vehicles/4/")
    private var vehiclesURL = URL(string: "https://swapi.dev/api/vehicles/?page=1")

    var session: URLSession

    init(type: ResponseType) {
        switch type {
        case .success:
            URLProtocolStub.testURLs = [filmURL: TestData.FilmRawData,
                                       filmsURL: TestData.FilmsRawData,
                                       personURL: TestData.PersonRawData,
                                       peopleURL: TestData.PeopleRawData,
                                       planetURL: TestData.PlanetRawData,
                                       planetsURL: TestData.PlanetsRawData,
                                       singleSpeciesURL: TestData.SingleSpeciesRawData,
                                       speciesURL: TestData.SpeciesPageRawData,
                                       starshipURL: TestData.StarshipRawData,
                                       starshipsURL: TestData.StarshipsRawData,
                                       vehicleURL: TestData.VehicleRawData,
                                       vehiclesURL: TestData.VehiclesRawData]
        case .failNotFound:
            URLProtocolStub.testURLs = [filmURL: TestData.NotFound,
                                       filmsURL: TestData.NotFound,
                                       personURL: TestData.NotFound,
                                       peopleURL: TestData.NotFound,
                                       planetURL: TestData.NotFound,
                                       planetsURL: TestData.NotFound,
                                       singleSpeciesURL: TestData.NotFound,
                                       speciesURL: TestData.NotFound,
                                       starshipURL: TestData.NotFound,
                                       starshipsURL: TestData.NotFound,
                                       vehicleURL: TestData.NotFound,
                                       vehiclesURL: TestData.NotFound]
        }

        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolStub.self]

        session = URLSession(configuration: config)
    }
}
