//
//  PersonDetailView.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/25/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: ListView.ViewModel
    var person: Person

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 8.0) {
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
            .padding(.horizontal)
        }
        .navigationTitle(person.name)
    }

    private func detailRow(label: String, value: String, units: String? = nil) -> some View {
        return HStack {
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
                    Text(film.title)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
    }
}

private struct PeopleRow: View {
    var people: [Person?]

    var body: some View {
        HStack(alignment: .top) {
            Text("People")
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            Spacer()
            LazyVStack(alignment: .trailing) {
                let unwrappedPeople = people.compactMap { $0 }
                ForEach(unwrappedPeople) { person in
                    Text(person.name)
                        .multilineTextAlignment(.trailing)
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
                    Text(planet.name)
                        .multilineTextAlignment(.trailing)
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
                    Text(singleSpecies.name)
                        .multilineTextAlignment(.trailing)
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
                    Text(starship.name)
                        .multilineTextAlignment(.trailing)
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
                    Text(vehicle.name)
                        .multilineTextAlignment(.trailing)
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var session = URLSessionMock(type: .success).session
    static var testPerson = TestData.Person

    static var previews: some View {
        DetailView(viewModel: .init(session: session), person: testPerson)
    }
}
