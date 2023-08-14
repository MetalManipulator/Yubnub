//
//  TestData.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/12/23.
//

import Foundation

struct TestData {
    // MARK: - Films
    /// A page of Films data loaded in from local file in `Data` format.
    static var FilmsRawData: Data = {
        guard let url = Bundle.main.url(forResource: "Films", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A page of Films data loaded in from local file.
    /// Need to drill into `results` in order to find the array of `Film`s.
    static var Films: FilmsWrapper? = {
        do {
            let decoded = try JSONDecoder().decode(FilmsWrapper.self, from: FilmsRawData)
            return decoded
        } catch {
            print(error)
        }
        return nil
    }()

    /// A page of `Film` data loaded in from local file in `Data` format.
    static var FilmRawData: Data = {
        guard let url = Bundle.main.url(forResource: "Film", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A single `Film` instance from local file.
    static var Film: Film = {
        Films?.results[0] ?? Film.empty()
    }()

    // MARK: - People
    /// A page of People data loaded in from local file in `Data` format.
    static var PeopleRawData: Data = {
        guard let url = Bundle.main.url(forResource: "People", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A page of People data loaded in from local file.
    /// Need to drill into `results` in order to find the array of `Person`s.
    static var People: PeopleWrapper? = {
        do {
            let decoded = try JSONDecoder().decode(PeopleWrapper.self, from: PeopleRawData)
            return decoded
        } catch {
            print(error)
        }
        return nil
    }()

    /// A single `Person` loaded in from local file in `Data` format.
    static var PersonRawData: Data = {
        guard let url = Bundle.main.url(forResource: "Person", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A single `Person` instance from local file.
    static var Person: Person = {
        People?.results[0] ?? Person.empty()
    }()

    // MARK: - Planets
    /// A page of Planets data loaded in from local file in `Data` format.
    static var PlanetsRawData: Data = {
        guard let url = Bundle.main.url(forResource: "Planets", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A page of Planets data loaded in from local file.
    /// Need to drill into `results` in order to find the array of `Planet`s.
    static var Planets: PlanetsWrapper? = {
        do {
            let decoded = try JSONDecoder().decode(PlanetsWrapper.self, from: PlanetsRawData)
            return decoded
        } catch {
            print(error)
        }
        return nil
    }()

    /// A page of `Planet` data loaded in from local file in `Data` format.
    static var PlanetRawData: Data = {
        guard let url = Bundle.main.url(forResource: "Planet", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A single `Planet` instance from local file.
    static var Planet: Planet = {
        Planets?.results[0] ?? Planet.empty()
    }()

    // MARK: - Species
    /// A page of Species data loaded in from local file in `Data` format.
    static var SpeciesPageRawData: Data = {
        guard let url = Bundle.main.url(forResource: "Species", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A page of Species data loaded in from local file.
    /// Need to drill into `results` in order to find the array of `Species`.
    static var SpeciesPage: SpeciesWrapper? = {
        do {
            let decoded = try JSONDecoder().decode(SpeciesWrapper.self, from: SpeciesPageRawData)
            return decoded
        } catch {
            print(error)
        }
        return nil
    }()

    /// A page of `Species` data loaded in from local file in `Data` format.
    static var SingleSpeciesRawData: Data = {
        guard let url = Bundle.main.url(forResource: "SingleSpecies", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A single `Species` instance from local file.
    static var Species: Species = {
        SpeciesPage?.results[0] ?? Species.empty()
    }()

    // MARK: - Starships
    /// A page of Starships data loaded in from local file in `Data` format.
    static var StarshipsRawData: Data = {
        guard let url = Bundle.main.url(forResource: "Starships", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A page of Starships data loaded in from local file.
    /// Need to drill into `results` in order to find the array of `Starship`s.
    static var Starships: StarshipsWrapper? = {
        do {
            let decoded = try JSONDecoder().decode(StarshipsWrapper.self, from: StarshipsRawData)
            return decoded
        } catch {
            print(error)
        }
        return nil
    }()

    /// A page of `Starship` data loaded in from local file in `Data` format.
    static var StarshipRawData: Data = {
        guard let url = Bundle.main.url(forResource: "Starship", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A single `Starship` instance from local file.
    static var Starship: Starship = {
        Starships?.results[0] ?? Starship.empty()
    }()

    // MARK: - Vehicles
    /// A page of Vehicles data loaded in from local file in `Data` format.
    static var VehiclesRawData: Data = {
        guard let url = Bundle.main.url(forResource: "Vehicles", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A page of Vehicles data loaded in from local file.
    /// Need to drill into `results` in order to find the array of `Vehicle`s.
    static var Vehicles: VehiclesWrapper? = {
        do {
            let decoded = try JSONDecoder().decode(VehiclesWrapper.self, from: VehiclesRawData)
            return decoded
        } catch {
            print(error)
        }
        return nil
    }()

    /// A page of `Vehicle` data loaded in from local file in `Data` format.
    static var VehicleRawData: Data = {
        guard let url = Bundle.main.url(forResource: "Vehicle", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A single `Vehicle` instance from local file.
    static var Vehicle: Vehicle = {
        Vehicles?.results[0] ?? Vehicle.empty()
    }()

    // MARK: - Error Responses
    /// The "not found" response when requesting an out of bounds resource from the API
    static var NotFound: Data = {
        guard let url = Bundle.main.url(forResource: "NotFound", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()
}
