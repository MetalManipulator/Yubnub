//
//  NetworkTests.swift
//  YubnubTests
//
//  Created by Levi Gustin on 7/30/23.
//

import XCTest
@testable import Yubnub

final class NetworkTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBuildQuery() throws {
        // Single entity URLs
        let filmResource = FilmResource(id: 1)
        XCTAssertEqual(filmResource.url.absoluteString, "https://swapi.dev/api/films/1/")
        let personResource = PersonResource(id: 1)
        XCTAssertEqual(personResource.url.absoluteString, "https://swapi.dev/api/people/1/")
        let planetResource = PlanetResource(id: 1)
        XCTAssertEqual(planetResource.url.absoluteString, "https://swapi.dev/api/planets/1/")
        let singleSpeciesResource = SingleSpeciesResource(id: 1)
        XCTAssertEqual(singleSpeciesResource.url.absoluteString, "https://swapi.dev/api/species/1/")
        let starshipResource = StarshipResource(id: 1)
        XCTAssertEqual(starshipResource.url.absoluteString, "https://swapi.dev/api/starships/1/")
        let vehicleResource = VehicleResource(id: 1)
        XCTAssertEqual(vehicleResource.url.absoluteString, "https://swapi.dev/api/vehicles/1/")

        // Pageless entities URLs
        let filmsResource = FilmsResource()
        XCTAssertEqual(filmsResource.url.absoluteString, "https://swapi.dev/api/films/")
        let peopleResource = PeopleResource()
        XCTAssertEqual(peopleResource.url.absoluteString, "https://swapi.dev/api/people/")
        let planetsResource = PlanetsResource()
        XCTAssertEqual(planetsResource.url.absoluteString, "https://swapi.dev/api/planets/")
        let speciesResource = SpeciesResource()
        XCTAssertEqual(speciesResource.url.absoluteString, "https://swapi.dev/api/species/")
        let starshipsResource = StarshipsResource()
        XCTAssertEqual(starshipsResource.url.absoluteString, "https://swapi.dev/api/starships/")
        let vehiclesResource = VehiclesResource()
        XCTAssertEqual(vehiclesResource.url.absoluteString, "https://swapi.dev/api/vehicles/")

        // Specific page of entities URLs
        let filmsPageResource = FilmsResource(pageNumber: 2)
        XCTAssertEqual(filmsPageResource.url.absoluteString, "https://swapi.dev/api/films/?page=2")
        let peoplePageResource = PeopleResource(pageNumber: 2)
        XCTAssertEqual(peoplePageResource.url.absoluteString, "https://swapi.dev/api/people/?page=2")
        let planetsPageResource = PlanetsResource(pageNumber: 2)
        XCTAssertEqual(planetsPageResource.url.absoluteString, "https://swapi.dev/api/planets/?page=2")
        let speciesPageResource = SpeciesResource(pageNumber: 2)
        XCTAssertEqual(speciesPageResource.url.absoluteString, "https://swapi.dev/api/species/?page=2")
        let starshipsPageResource = StarshipsResource(pageNumber: 2)
        XCTAssertEqual(starshipsPageResource.url.absoluteString, "https://swapi.dev/api/starships/?page=2")
        let vehiclesPageResource = VehiclesResource(pageNumber: 2)
        XCTAssertEqual(vehiclesPageResource.url.absoluteString, "https://swapi.dev/api/vehicles/?page=2")

        // Search entities URLs
        let filmsSearchResource = FilmsResource(searchString: "A New Hope")
        XCTAssertEqual(filmsSearchResource.url.absoluteString, "https://swapi.dev/api/films/?search=A%20New%20Hope")
        let peopleSearchResource = PeopleResource(searchString: "R2D2")
        XCTAssertEqual(peopleSearchResource.url.absoluteString, "https://swapi.dev/api/people/?search=R2D2")
        let planetsSearchResource = PlanetsResource(searchString: "Tatooine")
        XCTAssertEqual(planetsSearchResource.url.absoluteString, "https://swapi.dev/api/planets/?search=Tatooine")
        let speciesSearchResource = SpeciesResource(searchString: "Human")
        XCTAssertEqual(speciesSearchResource.url.absoluteString, "https://swapi.dev/api/species/?search=Human")
        let starshipsSearchResource = StarshipsResource(searchString: "Death Star")
        XCTAssertEqual(starshipsSearchResource.url.absoluteString,
                       "https://swapi.dev/api/starships/?search=Death%20Star")
        let vehiclesSearchResource = VehiclesResource(searchString: "Sand Crawler")
        XCTAssertEqual(vehiclesSearchResource.url.absoluteString,
                       "https://swapi.dev/api/vehicles/?search=Sand%20Crawler")
    }

    func testFilmRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = FilmResource(id: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.title, "A New Hope")
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }

    func testFilmsRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = FilmsResource(pageNumber: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.count, 6)
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }

    func testPersonRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = PersonResource(id: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.name, "Luke Skywalker")
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }

    func testPeopleRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = PeopleResource(pageNumber: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.count, 82)
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }

    func testPlanetRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = PlanetResource(id: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.name, "Tatooine")
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }

    func testPlanetsRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = PlanetsResource(pageNumber: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.count, 60)
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }

    func testSingleSpeciesRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = SingleSpeciesResource(id: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.name, "Human")
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }

    func testSpeciesRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = SpeciesResource(pageNumber: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.count, 37)
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }

    func testStarshipRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = StarshipResource(id: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.name, "CR90 corvette")
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }

    func testStarshipsRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = StarshipsResource(pageNumber: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.count, 36)
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }

    func testVehicleRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = VehicleResource(id: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.name, "Sand Crawler")
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }

    func testVehiclesRequest() throws {
        let successSession = URLSessionMock(type: .success).session
        let failureSession = URLSessionMock(type: .failNotFound).session

        let resource = StarshipsResource(pageNumber: 1)
        let request = APIRequest(resource: resource)

        request.execute(using: successSession) { response in
            XCTAssertEqual(response?.count, 39)
        }
        request.execute(using: failureSession) { response in
            XCTAssertNil(response)
        }
    }
}
