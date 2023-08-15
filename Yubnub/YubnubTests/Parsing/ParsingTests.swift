//
//  ParsingTests.swift
//  YubnubTests
//
//  Created by Levi Gustin on 7/29/23.
//

import XCTest
@testable import Yubnub

final class ParsingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOpenFilms() throws {
        let filmsWrapper = TestData.Films

        // Test simple mapping of keys to types
        XCTAssertEqual(filmsWrapper?.count, 6)
        XCTAssertNil(filmsWrapper?.next)
        XCTAssertNil(filmsWrapper?.previous)
        XCTAssertEqual(filmsWrapper?.results.count, 6)

        // Test computed vars
        XCTAssertNil(filmsWrapper?.nextPage)
    }

    func testOpenFilm() throws {
        let film = TestData.Film

        // Test simple mapping of keys to types
        XCTAssertEqual(film.title, "A New Hope")
        XCTAssertEqual(film.episodeID, 4)
        XCTAssertEqual(film.director, "George Lucas")
        XCTAssertEqual(film.producer, "Gary Kurtz, Rick McCallum")
        XCTAssertEqual(film.releaseDate, "1977-05-25")
        XCTAssertEqual(film.characters.count, 18)
        XCTAssertEqual(film.planets.count, 3)
        XCTAssertEqual(film.starships.count, 8)
        XCTAssertEqual(film.vehicles.count, 4)
        XCTAssertEqual(film.species.count, 5)
        XCTAssertEqual(film.url, "https://swapi.dev/api/films/1/")

        // Test computed vars
        XCTAssertEqual(film.id, 4)

        let emptyFilm = TestData.Film.empty()

        XCTAssertEqual(emptyFilm.title, "test title")
        XCTAssertEqual(emptyFilm.episodeID, 99)
        XCTAssertEqual(emptyFilm.openingCrawl, "test openingCrawl")
        XCTAssertEqual(emptyFilm.director, "test director")
        XCTAssertEqual(emptyFilm.producer, "test producer")
        XCTAssertEqual(emptyFilm.releaseDate, "test releaseDate")
        XCTAssertEqual(emptyFilm.characters, ["test characters"])
        XCTAssertEqual(emptyFilm.planets, ["test planets"])
        XCTAssertEqual(emptyFilm.starships, ["test starships"])
        XCTAssertEqual(emptyFilm.vehicles, ["test vehicles"])
        XCTAssertEqual(emptyFilm.species, ["test species"])
        XCTAssertEqual(emptyFilm.url, "test url")
    }

    func testOpenPeople() throws {
        let peopleWrapper = TestData.People

        // Test simple mapping of keys to types
        XCTAssertEqual(peopleWrapper?.count, 82)
        XCTAssertEqual(peopleWrapper?.next, "https://swapi.dev/api/people/?page=2")
        XCTAssertNil(peopleWrapper?.previous)
        XCTAssertEqual(peopleWrapper?.results.count, 10)

        // Test computed vars
        XCTAssertEqual(peopleWrapper?.nextPage, 2)
    }

    func testOpenPerson() throws {
        let person = TestData.Person

        // Test simple mapping of keys to types
        XCTAssertEqual(person.name, "Luke Skywalker")
        XCTAssertEqual(person.height, "172")
        XCTAssertEqual(person.mass, "77")
        XCTAssertEqual(person.hairColor, "blond")
        XCTAssertEqual(person.skinColor, "fair")
        XCTAssertEqual(person.eyeColor, "blue")
        XCTAssertEqual(person.birthYear, "19BBY")
        XCTAssertEqual(person.gender, "male")
        XCTAssertEqual(person.homeworld, "https://swapi.dev/api/planets/1/")
        XCTAssertEqual(person.films.count, 4)
        XCTAssertEqual(person.species.count, 0)
        XCTAssertEqual(person.vehicles.count, 2)
        XCTAssertEqual(person.starships.count, 2)
        XCTAssertEqual(person.url, "https://swapi.dev/api/people/1/")

        // Test computed vars
        XCTAssertEqual(person.id, 1)

        let emptyPerson = TestData.Person.empty()

        XCTAssertEqual(emptyPerson.name, "Test name")
        XCTAssertEqual(emptyPerson.height, "test height")
        XCTAssertEqual(emptyPerson.mass, "test mass")
        XCTAssertEqual(emptyPerson.hairColor, "test hairColor")
        XCTAssertEqual(emptyPerson.skinColor, "test skinColor")
        XCTAssertEqual(emptyPerson.eyeColor, "test eyeColor")
        XCTAssertEqual(emptyPerson.birthYear, "test birthYear")
        XCTAssertEqual(emptyPerson.gender, "test gender")
        XCTAssertEqual(emptyPerson.homeworld, "test homeworld")
        XCTAssertEqual(emptyPerson.films, ["test films"])
        XCTAssertEqual(emptyPerson.species, ["test species"])
        XCTAssertEqual(emptyPerson.vehicles, ["test vehicles"])
        XCTAssertEqual(emptyPerson.starships, ["test starships"])
        XCTAssertEqual(emptyPerson.url, "test url")
    }

    func testOpenPlanets() throws {
        let planetsWrapper = TestData.Planets

        // Test simple mapping of keys to types
        XCTAssertEqual(planetsWrapper?.count, 60)
        XCTAssertEqual(planetsWrapper?.next, "https://swapi.dev/api/planets/?page=2")
        XCTAssertNil(planetsWrapper?.previous)
        XCTAssertEqual(planetsWrapper?.results.count, 10)

        // Test computed vars
        XCTAssertEqual(planetsWrapper?.nextPage, 2)
    }

    func testOpenPlanet() throws {
        let planet = TestData.Planet

        // Test simple mapping of keys to types
        XCTAssertEqual(planet.name, "Tatooine")
        XCTAssertEqual(planet.rotationPeriod, "23")
        XCTAssertEqual(planet.orbitalPeriod, "304")
        XCTAssertEqual(planet.diameter, "10465")
        XCTAssertEqual(planet.climate, "arid")
        XCTAssertEqual(planet.gravity, "1 standard")
        XCTAssertEqual(planet.terrain, "desert")
        XCTAssertEqual(planet.surfaceWater, "1")
        XCTAssertEqual(planet.population, "200000")
        XCTAssertEqual(planet.residents.count, 10)
        XCTAssertEqual(planet.films.count, 5)
        XCTAssertEqual(planet.url, "https://swapi.dev/api/planets/1/")

        // Test computed vars
        XCTAssertEqual(planet.id, 1)

        let emptyPlanet = TestData.Planet.empty()

        XCTAssertEqual(emptyPlanet.name, "test name")
        XCTAssertEqual(emptyPlanet.rotationPeriod, "test rotationPeriod")
        XCTAssertEqual(emptyPlanet.orbitalPeriod, "test orbitalPeriod")
        XCTAssertEqual(emptyPlanet.diameter, "test diameter")
        XCTAssertEqual(emptyPlanet.climate, "test climate")
        XCTAssertEqual(emptyPlanet.gravity, "test gravity")
        XCTAssertEqual(emptyPlanet.terrain, "test terrain")
        XCTAssertEqual(emptyPlanet.surfaceWater, "test surfaceWater")
        XCTAssertEqual(emptyPlanet.population, "test population")
        XCTAssertEqual(emptyPlanet.residents, ["test residents"])
        XCTAssertEqual(emptyPlanet.films, ["test films"])
        XCTAssertEqual(emptyPlanet.url, "test url")
    }

    func testOpenSpeciesPage() throws {
        let speciesWrapper = TestData.SpeciesPage

        // Test simple mapping of keys to types
        XCTAssertEqual(speciesWrapper?.count, 37)
        XCTAssertEqual(speciesWrapper?.next, "https://swapi.dev/api/species/?page=2")
        XCTAssertNil(speciesWrapper?.previous)
        XCTAssertEqual(speciesWrapper?.results.count, 10)

        // Test computed vars
        XCTAssertEqual(speciesWrapper?.nextPage, 2)
    }

    func testOpenSingleSpecies() throws {
        let species = TestData.Species

        // Test simple mapping of keys to types
        XCTAssertEqual(species.name, "Human")
        XCTAssertEqual(species.classification, "mammal")
        XCTAssertEqual(species.designation, "sentient")
        XCTAssertEqual(species.averageHeight, "180")
        XCTAssertEqual(species.skinColors, "caucasian, black, asian, hispanic")
        XCTAssertEqual(species.hairColors, "blonde, brown, black, red")
        XCTAssertEqual(species.eyeColors, "brown, blue, green, hazel, grey, amber")
        XCTAssertEqual(species.averageLifespan, "120")
        XCTAssertEqual(species.homeworld, "https://swapi.dev/api/planets/9/")
        XCTAssertEqual(species.language, "Galactic Basic")
        XCTAssertEqual(species.people.count, 4)
        XCTAssertEqual(species.films.count, 6)
        XCTAssertEqual(species.url, "https://swapi.dev/api/species/1/")

        // Test computed vars
        XCTAssertEqual(species.id, 1)

        let emptySpecies = TestData.Species.empty()

        XCTAssertEqual(emptySpecies.name, "test name")
        XCTAssertEqual(emptySpecies.classification, "test classification")
        XCTAssertEqual(emptySpecies.designation, "test designation")
        XCTAssertEqual(emptySpecies.averageHeight, "test averageHeight")
        XCTAssertEqual(emptySpecies.skinColors, "test skinColors")
        XCTAssertEqual(emptySpecies.hairColors, "test hairColors")
        XCTAssertEqual(emptySpecies.eyeColors, "test eyeColors")
        XCTAssertEqual(emptySpecies.averageLifespan, "test averageLifespan")
        XCTAssertEqual(emptySpecies.homeworld, "test homeworld")
        XCTAssertEqual(emptySpecies.language, "test language")
        XCTAssertEqual(emptySpecies.people, ["test people"])
        XCTAssertEqual(emptySpecies.films, ["test films"])
        XCTAssertEqual(emptySpecies.url, "test url")
        XCTAssertEqual(emptySpecies.name, "test name")
    }

    func testOpenStarships() throws {
        let starshipsWrapper = TestData.Starships

        // Test simple mapping of keys to types
        XCTAssertEqual(starshipsWrapper?.count, 36)
        XCTAssertEqual(starshipsWrapper?.next, "https://swapi.dev/api/starships/?page=2")
        XCTAssertNil(starshipsWrapper?.previous)
        XCTAssertEqual(starshipsWrapper?.results.count, 10)

        // Test computed vars
        XCTAssertEqual(starshipsWrapper?.nextPage, 2)
    }

    func testOpenStarship() throws {
        let starship = TestData.Starship

        // Test simple mapping of keys to types
        XCTAssertEqual(starship.name, "CR90 corvette")
        XCTAssertEqual(starship.model, "CR90 corvette")
        XCTAssertEqual(starship.manufacturer, "Corellian Engineering Corporation")
        XCTAssertEqual(starship.costInCredits, "3500000")
        XCTAssertEqual(starship.length, "150")
        XCTAssertEqual(starship.maxAtmospheringSpeed, "950")
        XCTAssertEqual(starship.crew, "30-165")
        XCTAssertEqual(starship.passengers, "600")
        XCTAssertEqual(starship.cargoCapacity, "3000000")
        XCTAssertEqual(starship.consumables, "1 year")
        XCTAssertEqual(starship.hyperdriveRating, "2.0")
        XCTAssertEqual(starship.MGLT, "60")
        XCTAssertEqual(starship.starshipClass, "corvette")
        XCTAssertEqual(starship.pilots.count, 0)
        XCTAssertEqual(starship.films.count, 3)
        XCTAssertEqual(starship.url, "https://swapi.dev/api/starships/2/")

        // Test computed vars
        XCTAssertEqual(starship.id, 2)

        let emptyStarship = TestData.Starship.empty()

        XCTAssertEqual(emptyStarship.name, "test name")
        XCTAssertEqual(emptyStarship.model, "test model")
        XCTAssertEqual(emptyStarship.manufacturer, "test manufacturer")
        XCTAssertEqual(emptyStarship.costInCredits, "test costInCredits")
        XCTAssertEqual(emptyStarship.length, "test length")
        XCTAssertEqual(emptyStarship.maxAtmospheringSpeed, "test maxAtmospheringSpeed")
        XCTAssertEqual(emptyStarship.crew, "test crew")
        XCTAssertEqual(emptyStarship.passengers, "test passengers")
        XCTAssertEqual(emptyStarship.cargoCapacity, "test cargoCapacity")
        XCTAssertEqual(emptyStarship.consumables, "test consumables")
        XCTAssertEqual(emptyStarship.hyperdriveRating, "test hyperdriveRating")
        XCTAssertEqual(emptyStarship.MGLT, "test MGLT")
        XCTAssertEqual(emptyStarship.starshipClass, "test starshipClass")
        XCTAssertEqual(emptyStarship.pilots, ["test pilots"])
        XCTAssertEqual(emptyStarship.films, ["test films"])
        XCTAssertEqual(emptyStarship.url, "test url")
    }

    func testOpenVehicles() throws {
        let vehiclesWrapper = TestData.Vehicles

        // Test simple mapping of keys to types
        XCTAssertEqual(vehiclesWrapper?.count, 39)
        XCTAssertEqual(vehiclesWrapper?.next, "https://swapi.dev/api/vehicles/?page=2")
        XCTAssertNil(vehiclesWrapper?.previous)
        XCTAssertEqual(vehiclesWrapper?.results.count, 10)

        // Test computed vars
        XCTAssertEqual(vehiclesWrapper?.nextPage, 2)
    }

    func testOpenVehicle() throws {
        let vehicle = TestData.Vehicle

        // Test simple mapping of keys to types
        XCTAssertEqual(vehicle.name, "Sand Crawler")
        XCTAssertEqual(vehicle.model, "Digger Crawler")
        XCTAssertEqual(vehicle.manufacturer, "Corellia Mining Corporation")
        XCTAssertEqual(vehicle.costInCredits, "150000")
        XCTAssertEqual(vehicle.length, "36.8 ")
        XCTAssertEqual(vehicle.maxAtmospheringSpeed, "30")
        XCTAssertEqual(vehicle.crew, "46")
        XCTAssertEqual(vehicle.passengers, "30")
        XCTAssertEqual(vehicle.cargoCapacity, "50000")
        XCTAssertEqual(vehicle.consumables, "2 months")
        XCTAssertEqual(vehicle.vehicleClass, "wheeled")
        XCTAssertEqual(vehicle.pilots.count, 0)
        XCTAssertEqual(vehicle.films.count, 2)
        XCTAssertEqual(vehicle.url, "https://swapi.dev/api/vehicles/4/")

        // Test computed vars
        XCTAssertEqual(vehicle.id, 4)

        let emptyVehicle = TestData.Vehicle.empty()

        XCTAssertEqual(emptyVehicle.name, "test name")
        XCTAssertEqual(emptyVehicle.model, "test model")
        XCTAssertEqual(emptyVehicle.manufacturer, "test manufacturer")
        XCTAssertEqual(emptyVehicle.costInCredits, "test costInCredits")
        XCTAssertEqual(emptyVehicle.length, "test length")
        XCTAssertEqual(emptyVehicle.maxAtmospheringSpeed, "test maxAtmospheringSpeed")
        XCTAssertEqual(emptyVehicle.crew, "test crew")
        XCTAssertEqual(emptyVehicle.passengers, "test passengers")
        XCTAssertEqual(emptyVehicle.cargoCapacity, "test cargoCapacity")
        XCTAssertEqual(emptyVehicle.consumables, "test consumables")
        XCTAssertEqual(emptyVehicle.vehicleClass, "test vehicleClass")
        XCTAssertEqual(emptyVehicle.pilots, ["test pilots"])
        XCTAssertEqual(emptyVehicle.films, ["test films"])
        XCTAssertEqual(emptyVehicle.url, "test url")
    }
}
