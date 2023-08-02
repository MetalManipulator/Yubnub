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
                        NavigationLink(destination: DetailView(person: person)) {
                            listRow(person: person)
                        }
                        Divider()
                    }
                }
                bottomRow
            }
            .navigationTitle("SWAPI People")
        }
        .onAppear {
            viewModel.fetchNextPeoplePage() // Comment out for previews to work
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
                // Subtitle
                HStack(spacing: 16.0) {
                    HStack(spacing: 4.0) {
                        Image(systemName: "arrow.up.to.line")
                            .font(.footnote)
                        Text(person.height)
                            .foregroundColor(.primary)
                        Text("cm")
                            .font(.callout)
                    }
                    HStack(spacing: 4.0) {
                        Image(systemName: "scalemass")
                            .font(.footnote)
                        Text(person.mass)
                            .foregroundColor(.primary)
                        Text("kg")
                            .font(.callout)
                    }
                }
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
    static var viewModel = ListView.ViewModel(people: TestData.People?.results ?? [])

    static var previews: some View {
        ListView(viewModel: viewModel)
    }
}
