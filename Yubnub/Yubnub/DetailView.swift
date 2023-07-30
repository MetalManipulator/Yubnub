//
//  DetailView.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/25/23.
//

import SwiftUI

struct DetailView: View {
    var person: Person

    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Name: \(person.name)")
                Text("Height: \(person.height)cm")
                Text("Mass: \(person.mass)kg")
                Text("Hair Color: \(person.hairColor)")
                Text("Skin Color: \(person.skinColor)")
                Text("Eye Color: \(person.eyeColor)")
                Text("Birth Year: \(person.birthYear)")
            }
            Group {
                Text("Gender: \(person.gender)")
//                Text("Homeworld: \(person.homeworld)")
//                Text("Films: \(person.films)")
//                Text("Species: \(person.species)")
//                Text("Vehicles: \(person.vehicles)")
//                Text("Starships: \(person.starships)")
            }
        }
        .navigationTitle(person.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var testPerson = TestData.People?.results[0] ?? Person.empty()

    static var previews: some View {
        DetailView(person: testPerson)
    }
}
