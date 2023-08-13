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
        ScrollView {
            VStack(alignment: .leading) {
                Image(systemName: "person") // SWAPI doesn't provide images, maybe fetch from another source?
                    .font(.system(size: 160))

                HStack(spacing: 4.0) {
                    Text("Height: \(person.height)")
                    Text("cm")
                        .foregroundColor(.accentColor)
                }
                HStack(spacing: 4.0) {
                    Text("Mass: \(person.mass)")
                    Text("kg")
                        .foregroundColor(.accentColor)
                }
                Text("Hair color: \(person.hairColor)")
                Text("Skin color: \(person.skinColor)")
                Text("Eye color: \(person.eyeColor)")
                Text("Birth year: \(person.birthYear)")
                Text("Gender: \(person.gender)")
            }
        }
        .navigationTitle(person.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var testPerson = TestData.Person

    static var previews: some View {
        DetailView(person: testPerson)
    }
}
