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
        VStack {
            Text("List")

            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.people) { person in
                    //            NavigationLink(destination: DetailView(person: person)) {
                    listRow(person: person)
                    //            }
                }
            }
        }
        .navigationTitle("SWAPI")
        .onAppear {
//            viewModel.fetchPeople(forPage: 1)
        }
    }

    func listRow(person: Person) -> some View {
        return VStack(alignment: .leading) {
            Text(person.name)
            HStack {
                Text("h: \(person.height)cm")
                Text("m: \(person.mass)kg")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var viewModel = ListView.ViewModel(people: TestData.People?.results ?? [])

    static var previews: some View {
        ListView(viewModel: viewModel)
    }
}
