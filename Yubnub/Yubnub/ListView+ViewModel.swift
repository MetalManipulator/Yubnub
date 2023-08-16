//
//  ListView+ViewModel.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/28/23.
//

import Foundation

extension ListView {
    final public class ViewModel: ObservableObject {
        @Published private(set) var films: [Film?] = .init(repeating: nil, count: 25)
        @Published private(set) var people: [Person?] = .init(repeating: nil, count: 150)
        @Published private(set) var planets: [Planet?] = .init(repeating: nil, count: 150)
        @Published private(set) var species: [Species?] = .init(repeating: nil, count: 100)
        @Published private(set) var starships: [Starship?] = .init(repeating: nil, count: 100)
        @Published private(set) var vehicles: [Vehicle?] = .init(repeating: nil, count: 100)

        @Published private(set) var isLoading = false
        @Published private(set) var nextPage: Int? = 1

        private var filmRequest: APIRequest<FilmResource>?
        private var personRequest: APIRequest<PersonResource>?
        private var peopleRequest: APIRequest<PeopleResource>?
        private var planetRequest: APIRequest<PlanetResource>?
        private var singleSpeciesRequest: APIRequest<SingleSpeciesResource>?
        private var starshipRequest: APIRequest<StarshipResource>?
        private var vehicleRequest: APIRequest<VehicleResource>?

        private var session: URLSession

        init(session: URLSession = URLSession.shared) {
            self.session = session
        }

        /// Will request to fetch the next page of People
        func fetchNextPeoplePage() {
            if let nextPage = nextPage {
                fetchPeople(forPage: nextPage)
            } else {
                print("Reached end of pages")
            }
        }

        /// Determines the entry id from the url contained with the entry
        /// - Parameter url: The url string of the entry
        /// - Returns: The integer entry number contained with the url
        private func getEntryId(for url: String) -> Int? {
            let components = url.components(separatedBy: "/")
            let trimmed = components.dropLast(1).last
            if let trimmed = trimmed {
                return Int(trimmed)
            } else {
                print("Unable to determine entry id for: \(url)")
                return nil
            }
        }

        /// Gets the `Film` entities from local memory if known, requests if not
        /// - Parameter filmsURLs: The raw urls of the desired entities
        func getFilms(for filmsURLs: [String]) -> [Film?] {
            var filmsSubset: [Film?] = []

            // Covert to entry id from urls.
            let indices = filmsURLs.compactMap { getEntryId(for: $0) }

            for index in indices {
                // Request unknown films
                if films[index] == nil {
                    fetchFilm(for: index)
                }
                // Build subset
                filmsSubset.append(films[index])
            }

            return filmsSubset
        }

        /// Gets the `Person` entities from local memory if known, requests if not
        /// - Parameter personsURLs: The raw urls of the desired entities
        func getPersons(for personsURLs: [String]) -> [Person?] {
            var personsSubset: [Person?] = []

            // Covert to entry id from urls.
            let indices = personsURLs.compactMap { getEntryId(for: $0) }

            for index in indices {
                // Request unknown films
                if people[index] == nil {
                    fetchPerson(for: index)
                }
                // Build subset
                personsSubset.append(people[index])
            }

            return personsSubset
        }

        /// Gets the `Planet` entities from local memory if known, requests if not
        /// - Parameter planetsURLs: The raw urls of the desired entities
        func getPlanets(for planetsURLs: [String]) -> [Planet?] {
            var planetsSubset: [Planet?] = []

            // Covert to entry id from urls.
            let indices = planetsURLs.compactMap { getEntryId(for: $0) }

            for index in indices {
                // Request unknown films
                if planets[index] == nil {
                    fetchPlanet(for: index)
                }
                // Build subset
                planetsSubset.append(planets[index])
            }

            return planetsSubset
        }

        /// Gets the `Species` entities from local memory if known, requests if not
        /// - Parameter speciesURLs: The raw urls of the desired entities
        func getSpecies(for speciesURLs: [String]) -> [Species?] {
            var speciesSubset: [Species?] = []

            // Covert to entry id from urls.
            let indices = speciesURLs.compactMap { getEntryId(for: $0) }

            for index in indices {
                // Request unknown films
                if species[index] == nil {
                    fetchSingleSpecies(for: index)
                }
                // Build subset
                speciesSubset.append(species[index])
            }

            return speciesSubset
        }

        /// Gets the `Starship` entities from local memory if known, requests if not
        /// - Parameter starshipsURLs: The raw urls of the desired entities
        func getStarships(for starshipsURLs: [String]) -> [Starship?] {
            var starshipsSubset: [Starship?] = []

            // Covert to entry id from urls.
            let indices = starshipsURLs.compactMap { getEntryId(for: $0) }

            for index in indices {
                // Request unknown films
                if starships[index] == nil {
                    fetchStarship(for: index)
                }
                // Build subset
                starshipsSubset.append(starships[index])
            }

            return starshipsSubset
        }

        /// Gets the `Vehicle` entities from local memory if known, requests if not
        /// - Parameter vehiclesURLs: The raw urls of the desired entities
        func getVehicles(for vehiclesURLs: [String]) -> [Vehicle?] {
            var vehiclesSubset: [Vehicle?] = []

            // Covert to entry id from urls.
            let indices = vehiclesURLs.compactMap { getEntryId(for: $0) }

            for index in indices {
                // Request unknown films
                if vehicles[index] == nil {
                    fetchVehicle(for: index)
                }
                // Build subset
                vehiclesSubset.append(vehicles[index])
            }

            return vehiclesSubset
        }
    }
}

// Network page of entries fetches
extension ListView.ViewModel {
    /// Fetches the desired page of People from the API
    /// - Parameter page: The page number to fetch
    fileprivate func fetchPeople(forPage page: Int) {
        guard !isLoading else { return }
        isLoading = true

        let resource = PeopleResource(pageNumber: page)
        let request = APIRequest(resource: resource)
        self.peopleRequest = request

        request.execute(using: session) { [weak self] response in
            self?.isLoading = false
            self?.nextPage = response?.nextPage

            guard let results = response?.results else {
                print("No people found")
                self?.peopleRequest = nil
                return
            }

            // Initialize the Person array with empty objects to allow insertions
            if self?.people.isEmpty ?? true {
                self?.people = .init(repeating: nil, count: 150)
            }

            // Add found people into the Person array
            for person in results {
                self?.people[person.id] = person
            }
            self?.peopleRequest = nil
        }
    }
}

// Network single entry fetches
extension ListView.ViewModel {
    /// Fetches the desired `Film` entry from the API
    /// - Parameter id: The entry id to fetch
    fileprivate func fetchFilm(for id: Int) {
        guard filmRequest == nil else {
            return
        }

        let resource = FilmResource(id: id)
        let request = APIRequest(resource: resource)
        self.filmRequest = request

        request.execute(using: session) { [weak self] response in
            guard let response = response else {
                print("No film found")
                self?.filmRequest = nil
                return
            }

            // Initialize the Film array with empty objects to allow insertions
            if self?.films.isEmpty ?? true {
                self?.films = .init(repeating: nil, count: 25)
            }

            // Add found film into the Film array
            self?.films[response.id] = response

            self?.filmRequest = nil
        }
    }

    /// Fetches the desired `Person` entry from the API
    /// - Parameter id: The entry id to fetch
    fileprivate func fetchPerson(for id: Int) {
        guard personRequest == nil else {
            return
        }

        let resource = PersonResource(id: id)
        let request = APIRequest(resource: resource)
        self.personRequest = request

        request.execute(using: session) { [weak self] response in
            guard let response = response else {
                print("No person found")
                self?.personRequest = nil
                return
            }

            // Initialize the People array with empty objects to allow insertions
            if self?.people.isEmpty ?? true {
                self?.people = .init(repeating: nil, count: 150)
            }

            // Add found person into the People array
            self?.people[response.id] = response

            self?.personRequest = nil
        }
    }

    /// Fetches the desired `Planet` entry from the API
    /// - Parameter id: The entry id to fetch
    fileprivate func fetchPlanet(for id: Int) {
        guard planetRequest == nil else {
            return
        }

        let resource = PlanetResource(id: id)
        let request = APIRequest(resource: resource)
        self.planetRequest = request

        request.execute(using: session) { [weak self] response in
            guard let response = response else {
                print("No planet found")
                self?.planetRequest = nil
                return
            }

            // Initialize the Planets array with empty objects to allow insertions
            if self?.planets.isEmpty ?? true {
                self?.planets = .init(repeating: nil, count: 150)
            }

            // Add found planet into the Planets array
            self?.planets[response.id] = response

            self?.planetRequest = nil
        }
    }

    /// Fetches the desired `SingleSpecies` entry from the API
    /// - Parameter id: The entry id to fetch
    fileprivate func fetchSingleSpecies(for id: Int) {
        guard singleSpeciesRequest == nil else {
            return
        }

        let resource = SingleSpeciesResource(id: id)
        let request = APIRequest(resource: resource)
        self.singleSpeciesRequest = request

        request.execute(using: session) { [weak self] response in
            guard let response = response else {
                print("No single species found")
                self?.singleSpeciesRequest = nil
                return
            }

            // Initialize the Species array with empty objects to allow insertions
            if self?.species.isEmpty ?? true {
                self?.species = .init(repeating: nil, count: 100)
            }

            // Add found single species into the Speices array
            self?.species[response.id] = response

            self?.singleSpeciesRequest = nil
        }
    }

    /// Fetches the desired `Starship` entry from the API
    /// - Parameter id: The entry id to fetch
    fileprivate func fetchStarship(for id: Int) {
        guard starshipRequest == nil else {
            return
        }

        let resource = StarshipResource(id: id)
        let request = APIRequest(resource: resource)
        self.starshipRequest = request

        request.execute(using: session) { [weak self] response in
            guard let response = response else {
                print("No starship found")
                self?.starshipRequest = nil
                return
            }

            // Initialize the Starships array with empty objects to allow insertions
            if self?.starships.isEmpty ?? true {
                self?.starships = .init(repeating: nil, count: 100)
            }

            // Add found starship into the Starships array
            self?.starships[response.id] = response

            self?.starshipRequest = nil
        }
    }

    /// Fetches the desired `Vehicle` entry from the API
    /// - Parameter id: The entry id to fetch
    fileprivate func fetchVehicle(for id: Int) {
        guard vehicleRequest == nil else {
            return
        }

        let resource = VehicleResource(id: id)
        let request = APIRequest(resource: resource)
        self.vehicleRequest = request

        request.execute(using: session) { [weak self] response in
            guard let response = response else {
                print("No vehicle found")
                self?.vehicleRequest = nil
                return
            }

            // Initialize the Vehicles array with empty objects to allow insertions
            if self?.vehicles.isEmpty ?? true {
                self?.vehicles = .init(repeating: nil, count: 100)
            }

            // Add found vehicle into the Vehicles array
            self?.vehicles[response.id] = response

            self?.vehicleRequest = nil
        }
    }
}
