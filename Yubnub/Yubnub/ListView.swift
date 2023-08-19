//
//  ListView.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/25/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    let people = viewModel.people.compactMap { $0 }
                    ForEach(people) { person in
                        NavigationLink(value: person) {
                            listRow(person: person)
                        }
                        .accessibilityIdentifier("List Row")
                        Divider()
                    }
                }
                bottomRow
            }
            .navigationTitle("SWAPI People")
            .navigationDestination(for: Film.self) { film in
                DetailView(viewModel: viewModel, record: film)
            }
            .navigationDestination(for: Person.self) { person in
                DetailView(viewModel: viewModel, record: person)
            }
            .navigationDestination(for: Planet.self) { planet in
                DetailView(viewModel: viewModel, record: planet)
            }
            .navigationDestination(for: Species.self) { species in
                DetailView(viewModel: viewModel, record: species)
            }
            .navigationDestination(for: Starship.self) { starship in
                DetailView(viewModel: viewModel, record: starship)
            }
            .navigationDestination(for: Vehicle.self) { vehicle in
                DetailView(viewModel: viewModel, record: vehicle)
            }
        }
        .onAppear {
            viewModel.fetchNextPeoplePage()
        }
    }

    /// Table list row for each `Person`
    func listRow(person: Person) -> some View {
        return HStack {
            VStack(alignment: .leading, spacing: 8.0) {
                // Title
                Text(person.name)
                    .foregroundColor(.primary)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                // Subtitle
                HStack(spacing: 16.0) {
                    HStack(spacing: 4.0) {
                        Image(systemName: "arrow.up.to.line")
                            .font(.footnote)
                        Text("\(person.height) cm")
                            .foregroundColor(.primary)
                    }
                    HStack(spacing: 4.0) {
                        Image(systemName: "scalemass")
                            .font(.footnote)
                        Text("\(person.mass) kg")
                            .foregroundColor(.primary)
                    }
                }
                .multilineTextAlignment(.leading)
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal)
    }

    @ViewBuilder
    /// Used to show appropirate last row on table depending on situation
    var bottomRow: some View {
        if viewModel.isLoading { // Show progress spinner if we are fetching data
            HStack(spacing: 8.0) {
                ProgressView()
                Text("Loading more results")
            }
        } else if viewModel.nextPage != nil { // Show action button to allow user to fetch next page
            Button(action: { // Manual button isn't favorite, but auto-fetch wasn't working quickly
                viewModel.fetchNextPeoplePage()
            }, label: {
                Text("Fetch more results")
            })
        } else { // Show confiramtion if all pages have been fetched
            Text("No more results")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var session = URLSessionMock(type: .success).session

    static var previews: some View {
        ListView(viewModel: ListView.ViewModel(session: session))
    }
}
