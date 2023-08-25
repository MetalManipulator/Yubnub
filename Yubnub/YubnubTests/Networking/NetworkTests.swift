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

    func testSingleEntityRequestsPositive() throws {
        let successSession = URLSessionMock(type: .success).session
        
        let filmResource = FilmResource(id: 1)
        let personResource = PersonResource(id: 1)
        let planetResource = PlanetResource(id: 1)
        let speciesResource = SingleSpeciesResource(id: 1)
        let starshipResource = StarshipResource(id: 2)
        let vehicleResource = VehicleResource(id: 4)
        
        let filmRequest = APIRequest(resource: filmResource)
        let personRequest = APIRequest(resource: personResource)
        let planetRequest = APIRequest(resource: planetResource)
        let speciesRequest = APIRequest(resource: speciesResource)
        let starshipRequest = APIRequest(resource: starshipResource)
        let vehicleRequest = APIRequest(resource: vehicleResource)
        
        let filmExpectation = expectation(description: "Film Data Loaded")
        let personExpectation = expectation(description: "Person Data Loaded")
        let planetExpectation = expectation(description: "Planet Data Loaded")
        let speciesExpectation = expectation(description: "Species Data Loaded")
        let starshipExpectation = expectation(description: "Starship Data Loaded")
        let vehicleExpectation = expectation(description: "Vehicle Data Loaded")
        
        filmRequest.execute(using: successSession) { response in
            XCTAssertEqual(response?.title, "A New Hope")
            filmExpectation.fulfill()
        }
        
        personRequest.execute(using: successSession) { response in
            XCTAssertEqual(response?.name, "Luke Skywalker")
            personExpectation.fulfill()
        }
        
        planetRequest.execute(using: successSession) { response in
            XCTAssertEqual(response?.name, "Tatooine")
            planetExpectation.fulfill()
        }
        
        speciesRequest.execute(using: successSession) { response in
            XCTAssertEqual(response?.name, "Human")
            speciesExpectation.fulfill()
        }
        
        starshipRequest.execute(using: successSession) { response in
            XCTAssertEqual(response?.name, "CR90 corvette")
            starshipExpectation.fulfill()
        }
        
        vehicleRequest.execute(using: successSession) { response in
            XCTAssertEqual(response?.name, "Sand Crawler")
            vehicleExpectation.fulfill()
        }
        
        wait(for: [filmExpectation,
                   personExpectation,
                   planetExpectation,
                   speciesExpectation,
                   starshipExpectation,
                   vehicleExpectation],
             timeout: 1)
    }

    func testSingleEntityRequestsNegative() throws {
        let failureSession = URLSessionMock(type: .failNotFound).session
        
        let filmResource = FilmResource(id: 1)
        let personResource = PersonResource(id: 1)
        let planetResource = PlanetResource(id: 1)
        let speciesResource = SingleSpeciesResource(id: 1)
        let starshipResource = StarshipResource(id: 2)
        let vehicleResource = VehicleResource(id: 4)
        
        let filmRequest = APIRequest(resource: filmResource)
        let personRequest = APIRequest(resource: personResource)
        let planetRequest = APIRequest(resource: planetResource)
        let speciesRequest = APIRequest(resource: speciesResource)
        let starshipRequest = APIRequest(resource: starshipResource)
        let vehicleRequest = APIRequest(resource: vehicleResource)
        
        let filmExpectation = expectation(description: "Film Data Not Loaded")
        let personExpectation = expectation(description: "Person Data Not Loaded")
        let planetExpectation = expectation(description: "Planet Data Not Loaded")
        let speciesExpectation = expectation(description: "Species Data Not Loaded")
        let starshipExpectation = expectation(description: "Starship Data Not Loaded")
        let vehicleExpectation = expectation(description: "Vehicle Data Not Loaded")

        filmRequest.execute(using: failureSession) { response in
            XCTAssertNil(response)
            filmExpectation.fulfill()
        }
        
        personRequest.execute(using: failureSession) { response in
            XCTAssertNil(response)
            personExpectation.fulfill()
        }
        
        planetRequest.execute(using: failureSession) { response in
            XCTAssertNil(response)
            planetExpectation.fulfill()
        }
        
        speciesRequest.execute(using: failureSession) { response in
            XCTAssertNil(response)
            speciesExpectation.fulfill()
        }
        
        starshipRequest.execute(using: failureSession) { response in
            XCTAssertNil(response)
            starshipExpectation.fulfill()
        }
        
        vehicleRequest.execute(using: failureSession) { response in
            XCTAssertNil(response)
            vehicleExpectation.fulfill()
        }
        
        wait(for: [filmExpectation,
                   personExpectation,
                   planetExpectation,
                   speciesExpectation,
                   starshipExpectation,
                   vehicleExpectation],
             timeout: 1)
    }
    
    func testPageRequestsPositive() throws {
        let successSession = URLSessionMock(type: .success).session
        
        let filmsResource = FilmsResource(pageNumber: 1)
        let peopleResource = PeopleResource(pageNumber: 1)
        let planetsResource = PlanetsResource(pageNumber: 1)
        let speciesResource = SpeciesResource(pageNumber: 1)
        let starshipsResource = StarshipsResource(pageNumber: 1)
        let vehiclesResource = VehiclesResource(pageNumber: 1)
        
        let filmsRequest = APIRequest(resource: filmsResource)
        let peopleRequest = APIRequest(resource: peopleResource)
        let planetsRequest = APIRequest(resource: planetsResource)
        let speciesRequest = APIRequest(resource: speciesResource)
        let starshipsRequest = APIRequest(resource: starshipsResource)
        let vehiclesRequest = APIRequest(resource: vehiclesResource)
        
        let filmsExpectation = expectation(description: "Films Data Loaded")
        let peopleExpectation = expectation(description: "People Data Loaded")
        let planetsExpectation = expectation(description: "Planets Data Loaded")
        let speciesExpectation = expectation(description: "Species Data Loaded")
        let starshipsExpectation = expectation(description: "Starships Data Loaded")
        let vehiclesExpectation = expectation(description: "Vehicles Data Loaded")
        
        filmsRequest.execute(using: successSession) { response in
            XCTAssertEqual(response?.count, 6)
            filmsExpectation.fulfill()
        }
        
        peopleRequest.execute(using: successSession) { response in
            XCTAssertEqual(response?.count, 82)
            peopleExpectation.fulfill()
        }
        
        planetsRequest.execute(using: successSession) { response in
            XCTAssertEqual(response?.count, 60)
            planetsExpectation.fulfill()
        }
        
        speciesRequest.execute(using: successSession) { response in
            XCTAssertEqual(response?.count, 37)
            speciesExpectation.fulfill()
        }
        
        starshipsRequest.execute(using: successSession) { response in
            XCTAssertEqual(response?.count, 36)
            starshipsExpectation.fulfill()
        }
        
        vehiclesRequest.execute(using: successSession) { response in
            XCTAssertEqual(response?.count, 39)
            vehiclesExpectation.fulfill()
        }
        
        wait(for: [filmsExpectation,
                   peopleExpectation,
                   planetsExpectation,
                   speciesExpectation,
                   starshipsExpectation,
                   vehiclesExpectation],
             timeout: 1)
    }

    func testPageRequestsNegative() throws {
        let failureSession = URLSessionMock(type: .failNotFound).session
        
        let filmsResource = FilmsResource(pageNumber: 1)
        let peopleResource = PeopleResource(pageNumber: 1)
        let planetsResource = PlanetsResource(pageNumber: 1)
        let speciesResource = SpeciesResource(pageNumber: 1)
        let starshipsResource = StarshipsResource(pageNumber: 1)
        let vehiclesResource = VehiclesResource(pageNumber: 1)
        
        let filmsRequest = APIRequest(resource: filmsResource)
        let peopleRequest = APIRequest(resource: peopleResource)
        let planetsRequest = APIRequest(resource: planetsResource)
        let speciesRequest = APIRequest(resource: speciesResource)
        let starshipsRequest = APIRequest(resource: starshipsResource)
        let vehiclesRequest = APIRequest(resource: vehiclesResource)
        
        let filmsExpectation = expectation(description: "Films Not Data Loaded")
        let peopleExpectation = expectation(description: "People Not Data Loaded")
        let planetsExpectation = expectation(description: "Planets Not Data Loaded")
        let speciesExpectation = expectation(description: "Species Not Data Loaded")
        let starshipsExpectation = expectation(description: "Starships Not Data Loaded")
        let vehiclesExpectation = expectation(description: "Vehicles Not Data Loaded")
        
        filmsRequest.execute(using: failureSession) { response in
            XCTAssertNil(response)
            filmsExpectation.fulfill()
        }
        
        peopleRequest.execute(using: failureSession) { response in
            XCTAssertNil(response)
            peopleExpectation.fulfill()
        }
        
        planetsRequest.execute(using: failureSession) { response in
            XCTAssertNil(response)
            planetsExpectation.fulfill()
        }
        
        speciesRequest.execute(using: failureSession) { response in
            XCTAssertNil(response)
            speciesExpectation.fulfill()
        }
        
        starshipsRequest.execute(using: failureSession) { response in
            XCTAssertNil(response)
            starshipsExpectation.fulfill()
        }
        
        vehiclesRequest.execute(using: failureSession) { response in
            XCTAssertNil(response)
            vehiclesExpectation.fulfill()
        }
        
        wait(for: [filmsExpectation,
                   peopleExpectation,
                   planetsExpectation,
                   speciesExpectation,
                   starshipsExpectation,
                   vehiclesExpectation],
             timeout: 1)
    }
}
