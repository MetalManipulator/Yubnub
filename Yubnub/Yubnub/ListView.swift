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
//                if viewModel.nextPage != nil {
                    loadingRow
//                }
            }
            .navigationTitle("SWAPI People")
        }
    }

    func listRow(person: Person) -> some View {
        return HStack {
            VStack(alignment: .leading, spacing: 8.0) {
                Text(person.name)
                    .foregroundColor(.black)
                    .font(.title3)
                HStack(spacing: 16.0) {
                    HStack(spacing: 4.0) {
                        Image(systemName: "arrow.up.to.line")
                        Text("\(person.height)cm")
                    }
                    HStack(spacing: 4.0) {
                        Image(systemName: "scalemass")
                        Text("\(person.mass)kg")
                    }
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.horizontal)
    }

    var loadingRow: some View {
        VStack {
            Text("Loading more results")
            ProgressView()
        }
        .onAppear {
            viewModel.fetchNextPeoplePage()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var viewModel = ListView.ViewModel(people: TestData.People?.results ?? [])

    static var previews: some View {
        ListView(viewModel: viewModel)
    }
}
