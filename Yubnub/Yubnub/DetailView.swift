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
            VStack(alignment: .center, spacing: 8.0) {
                Image(systemName: "person") // SWAPI doesn't provide images, maybe fetch from another source?
                    .font(.system(size: 160))
                    .padding()

                detailRow(label: "Height", value: person.height, units: "cm")
                detailRow(label: "Mass", value: person.mass, units: "kg")
                detailRow(label: "Hair color", value: person.hairColor)
                detailRow(label: "Skin color", value: person.skinColor)
                detailRow(label: "Eye color", value: person.eyeColor)
                detailRow(label: "Birth year", value: person.birthYear)
                detailRow(label: "Gender", value: person.gender)
            }
            .padding(.horizontal)
        }
        .navigationTitle(person.name)
    }

    private func detailRow(label: String, value: String, units: String? = nil) -> some View {
        return HStack {
            Text(label)
            Spacer()
            if let units = units {
                Text(value + " " + units)
            } else {
                Text(value)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var testPerson = TestData.Person

    static var previews: some View {
        DetailView(person: testPerson)
    }
}
