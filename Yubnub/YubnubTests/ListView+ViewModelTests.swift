//
//  ListView+ViewModelTests.swift
//  YubnubTests
//
//  Created by Levi Gustin on 8/15/23.
//

import XCTest

final class ListViewViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetFilms() throws {
        let viewModel = ListView.ViewModel(session: URLSessionMock(type: .success).session)
        let filmsURLs = [
            "https://swapi.dev/api/films/1/",
            "https://swapi.dev/api/films/2/",
            "https://swapi.dev/api/films/3/"
        ]

        let filmsObjects = viewModel.getFilms(for: filmsURLs)
        XCTAssertEqual(filmsObjects.count, 3)
    }

    func testGetPersons() throws {
        let viewModel = ListView.ViewModel(session: URLSessionMock(type: .success).session)
        let personsURLs = [
            "https://swapi.dev/api/people/1/",
            "https://swapi.dev/api/people/2/",
            "https://swapi.dev/api/people/3/"
        ]

        let personsObjects = viewModel.getPersons(for: personsURLs)
        XCTAssertEqual(personsObjects.count, 3)
    }

    func testGetPlanets() throws {
        let viewModel = ListView.ViewModel(session: URLSessionMock(type: .success).session)
        let planetsURLs = [
            "https://swapi.dev/api/planets/1/",
            "https://swapi.dev/api/planets/2/",
            "https://swapi.dev/api/planets/3/"
        ]

        let planetsObjects = viewModel.getPlanets(for: planetsURLs)
        XCTAssertEqual(planetsObjects.count, 3)
    }

    func testGetSpecies() throws {
        let viewModel = ListView.ViewModel(session: URLSessionMock(type: .success).session)
        let speciesURLs = [
            "https://swapi.dev/api/species/1/",
            "https://swapi.dev/api/species/2/",
            "https://swapi.dev/api/species/3/"
        ]

        let speciesObjects = viewModel.getSpecies(for: speciesURLs)
        XCTAssertEqual(speciesObjects.count, 3)
    }

    func testGetStarships() throws {
        let viewModel = ListView.ViewModel(session: URLSessionMock(type: .success).session)
        let starshipsURLs = [
            "https://swapi.dev/api/starships/1/",
            "https://swapi.dev/api/starships/2/",
            "https://swapi.dev/api/starships/3/"
        ]

        let starshipsObjects = viewModel.getStarships(for: starshipsURLs)
        XCTAssertEqual(starshipsObjects.count, 3)
    }

    func testGetVehicles() throws {
        let viewModel = ListView.ViewModel(session: URLSessionMock(type: .success).session)
        let vehiclesURLs = [
            "https://swapi.dev/api/vehicles/1/",
            "https://swapi.dev/api/vehicles/2/",
            "https://swapi.dev/api/vehicles/3/"
        ]

        let vehiclesObjects = viewModel.getVehicles(for: vehiclesURLs)
        XCTAssertEqual(vehiclesObjects.count, 3)
    }
}
