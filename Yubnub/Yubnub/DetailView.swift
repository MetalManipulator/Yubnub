//
//  PersonDetailView.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/25/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: ListView.ViewModel
    var record: SwapiRecord

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 8.0) {
                switch record {
                case let film as Film:
                    filmDetails(for: film)
                case let person as Person:
                    personDetails(for: person)
                case let planet as Planet:
                    planetDetails(for: planet)
                case let species as Species:
                    speciesDetails(for: species)
                case let starship as Starship:
                    starshipDetails(for: starship)
                case let vehicle as Vehicle:
                    vehicleDetails(for: vehicle)
                default:
                    Text("Unkown record type")
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(record.name)
    }

    private func filmDetails(for film: Film) -> some View {
        return Group {
            Image(systemName: "film") // SWAPI doesn't provide images, maybe fetch from another source?
                .font(.system(size: 160))
                .padding()

            // Single, easy entries
            Group {
                detailRow(label: "Episode number", value: String(film.episodeID))
                detailRow(label: "Director", value: film.director)
                detailRow(label: "Producer", value: film.producer)
                detailRow(label: "Release date", value: film.releaseDate)
            }

            // Array or lookup entries
            Group {
                PeopleRow(label: "Characters", people: viewModel.getPersons(for: film.characters))
                PlanetsRow(label: "Planets", planets: viewModel.getPlanets(for: film.planets))
                StarshipsRow(starships: viewModel.getStarships(for: film.starships))
                VehiclesRow(vehicles: viewModel.getVehicles(for: film.vehicles))
                SpeciesRow(species: viewModel.getSpecies(for: film.species))
            }

            // Opening crawl
            detailRow(label: "Opening crawl", value: film.openingCrawl)
        }
    }

    private func personDetails(for person: Person) -> some View {
        return Group {
            Image(systemName: "person") // SWAPI doesn't provide images, maybe fetch from another source?
                .font(.system(size: 160))
                .padding()

            // Single, easy entries
            Group {
                detailRow(label: "Height", value: person.height, units: "cm")
                detailRow(label: "Mass", value: person.mass, units: "kg")
                detailRow(label: "Hair color", value: person.hairColor)
                detailRow(label: "Skin color", value: person.skinColor)
                detailRow(label: "Eye color", value: person.eyeColor)
                detailRow(label: "Birth year", value: person.birthYear)
                detailRow(label: "Gender", value: person.gender)
            }

            // Array or lookup entries
            Group {
                PlanetsRow(label: "Homeworld", planets: viewModel.getPlanets(for: [person.homeworld]))
                FilmsRow(films: viewModel.getFilms(for: person.films))
                SpeciesRow(species: viewModel.getSpecies(for: person.species))
                VehiclesRow(vehicles: viewModel.getVehicles(for: person.vehicles))
                StarshipsRow(starships: viewModel.getStarships(for: person.starships))
            }
        }
    }

    private func planetDetails(for planet: Planet) -> some View {
        return Group {
            Image(systemName: "globe") // SWAPI doesn't provide images, maybe fetch from another source?
                .font(.system(size: 160))
                .padding()

            // Single, easy entries
            Group {
                detailRow(label: "Rotation period", value: planet.rotationPeriod, units: "hrs")
                detailRow(label: "Orbital period", value: planet.orbitalPeriod, units: "days")
                detailRow(label: "Diameter", value: planet.diameter, units: "km")
                detailRow(label: "Climate", value: planet.climate)
                detailRow(label: "Gravity", value: planet.gravity, units: "G")
                detailRow(label: "Terrain", value: planet.terrain)
                detailRow(label: "Surface water", value: planet.surfaceWater, units: "%")
                detailRow(label: "Population", value: planet.population)
            }

            // Array or lookup entries
            Group {
                PeopleRow(label: "Residents", people: viewModel.getPersons(for: planet.residents))
                FilmsRow(films: viewModel.getFilms(for: planet.films))
            }
        }
    }

    private func speciesDetails(for species: Species) -> some View {
        return Group {
            Image(systemName: "lizard") // SWAPI doesn't provide images, maybe fetch from another source?
                .font(.system(size: 160))
                .padding()

            // Single, easy entries
            Group {
                detailRow(label: "Classification", value: species.classification)
                detailRow(label: "Designation", value: species.designation)
                detailRow(label: "Average height", value: species.averageHeight, units: "cm")
                detailRow(label: "Skin colors", value: species.skinColors)
                detailRow(label: "Hair colors", value: species.hairColors)
                detailRow(label: "Eye colors", value: species.eyeColors)
                detailRow(label: "Average lifespan", value: species.averageLifespan, units: "yrs")
                detailRow(label: "Language", value: species.language)
            }

            // Array or lookup entries
            Group {
                PlanetsRow(label: "Homeworld", planets: viewModel.getPlanets(for: [species.homeworld ?? ""]))
                PeopleRow(label: "People", people: viewModel.getPersons(for: species.people))
                FilmsRow(films: viewModel.getFilms(for: species.films))
            }
        }
    }

    private func starshipDetails(for starship: Starship) -> some View {
        return Group {
            Image(systemName: "sailboat") // SWAPI doesn't provide images, maybe fetch from another source?
                .font(.system(size: 160))
                .padding()

            // Single, easy entries
            Group {
                detailRow(label: "Model", value: starship.model)
                detailRow(label: "Manufacturer", value: starship.manufacturer)
                detailRow(label: "Cost", value: starship.costInCredits, units: "credits")
                detailRow(label: "Length", value: starship.length, units: "m")
                detailRow(label: "Max atmos speed", value: starship.maxAtmospheringSpeed)
                detailRow(label: "Crew", value: starship.crew)
                detailRow(label: "Passengers", value: starship.passengers)
                detailRow(label: "Cargo capacity", value: starship.cargoCapacity, units: "kg")
                detailRow(label: "Consumables", value: starship.consumables)
                detailRow(label: "Hyperdrive rating", value: starship.hyperdriveRating)
            }
            Group {
                detailRow(label: "MGLT", value: starship.MGLT, units: "mglts/hr")
                detailRow(label: "Starship class", value: starship.starshipClass)
            }

            // Array or lookup entries
            Group {
                PeopleRow(label: "Pilots", people: viewModel.getPersons(for: starship.pilots))
                FilmsRow(films: viewModel.getFilms(for: starship.films))
            }
        }
    }

    private func vehicleDetails(for vehicle: Vehicle) -> some View {
        return Group {
            Image(systemName: "scooter") // SWAPI doesn't provide images, maybe fetch from another source?
                .font(.system(size: 160))
                .padding()

            // Single, easy entries
            Group {
                detailRow(label: "Model", value: vehicle.model)
                detailRow(label: "Manufacturer", value: vehicle.manufacturer)
                detailRow(label: "Cost", value: vehicle.costInCredits, units: "credits")
                detailRow(label: "Length", value: vehicle.length, units: "m")
                detailRow(label: "Max atmos speed", value: vehicle.maxAtmospheringSpeed)
                detailRow(label: "Crew", value: vehicle.crew)
                detailRow(label: "Passengers", value: vehicle.passengers)
                detailRow(label: "Cargo capacity", value: vehicle.cargoCapacity, units: "kg")
                detailRow(label: "Consumables", value: vehicle.consumables)
                detailRow(label: "Vehicle class", value: vehicle.vehicleClass)
            }

            // Array or lookup entries
            Group {
                PeopleRow(label: "Pilots", people: viewModel.getPersons(for: vehicle.pilots))
                FilmsRow(films: viewModel.getFilms(for: vehicle.films))
            }
        }
    }

    private func detailRow(label: String, value: String, units: String? = nil) -> some View {
        return HStack(alignment: .top) {
            Text(label)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            Spacer()
            if let units = units {
                Text(value + " " + units)
                    .multilineTextAlignment(.trailing)
            } else {
                Text(value)
                    .multilineTextAlignment(.trailing)
            }
        }
    }
}

private struct FilmsRow: View {
    var films: [Film?]

    var body: some View {
        HStack(alignment: .top) {
            Text("Films")
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            Spacer()
            LazyVStack(alignment: .trailing) {
                let unwrappedFilms = films.compactMap { $0 }
                ForEach(unwrappedFilms) { film in
                    NavigationLink(value: film) {
                        Text(film.title)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

private struct PeopleRow: View {
    var label: String
    var people: [Person?]

    var body: some View {
        HStack(alignment: .top) {
            Text(label)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            Spacer()
            LazyVStack(alignment: .trailing) {
                let unwrappedPeople = people.compactMap { $0 }
                ForEach(unwrappedPeople) { person in
                    NavigationLink(value: person) {
                        Text(person.name)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

private struct PlanetsRow: View {
    var label: String
    var planets: [Planet?]

    var body: some View {
        HStack(alignment: .top) {
            Text(label)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            Spacer()
            LazyVStack(alignment: .trailing) {
                let unwrappedPlanets = planets.compactMap { $0 }
                ForEach(unwrappedPlanets) { planet in
                    NavigationLink(value: planet) {
                        Text(planet.name)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

private struct SpeciesRow: View {
    var species: [Species?]

    var body: some View {
        HStack(alignment: .top) {
            Text("Species")
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            Spacer()
            LazyVStack(alignment: .trailing) {
                let unwrappedSpecies = species.compactMap { $0 }
                ForEach(unwrappedSpecies) { singleSpecies in
                    NavigationLink(value: singleSpecies) {
                        Text(singleSpecies.name)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

private struct StarshipsRow: View {
    var starships: [Starship?]

    var body: some View {
        HStack(alignment: .top) {
            Text("Starships")
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            Spacer()
            LazyVStack(alignment: .trailing) {
                let unwrappedStarships = starships.compactMap { $0 }
                ForEach(unwrappedStarships) { starship in
                    NavigationLink(value: starship) {
                        Text(starship.name)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

private struct VehiclesRow: View {
    var vehicles: [Vehicle?]

    var body: some View {
        HStack(alignment: .top) {
            Text("Vehicles")
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            Spacer()
            LazyVStack(alignment: .trailing) {
                let unwrappedVehicles = vehicles.compactMap { $0 }
                ForEach(unwrappedVehicles) { vehicle in
                    NavigationLink(value: vehicle) {
                        Text(vehicle.name)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var session = URLSessionMock(type: .success).session
    static var testFilm = TestData.Film
    static var testPerson = TestData.Person
    static var testPlanet = TestData.Planet
    static var testSpecies = TestData.Species
    static var testStarship = TestData.Starship
    static var testVehicle = TestData.Vehicle

    static var previews: some View {
        DetailView(viewModel: .init(session: session), record: testFilm)
            .previewDisplayName("Film")
        DetailView(viewModel: .init(session: session), record: testPerson)
            .previewDisplayName("Person")
        DetailView(viewModel: .init(session: session), record: testPlanet)
            .previewDisplayName("Planet")
        DetailView(viewModel: .init(session: session), record: testSpecies)
            .previewDisplayName("Species")
        DetailView(viewModel: .init(session: session), record: testStarship)
            .previewDisplayName("Starship")
        DetailView(viewModel: .init(session: session), record: testVehicle)
            .previewDisplayName("Vehicle")
    }
}
