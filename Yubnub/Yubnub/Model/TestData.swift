//
//  TestData.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/12/23.
//

import Foundation

struct TestData {
    /// A page of Peole data loaded in from local file in `Data` format.
    static var PeopleRawData: Data = {
        guard let url = Bundle.main.url(forResource: "People", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A page of People data loaded in from local file.
    /// Need to drill into `results` in order to find the array of `Person`s.
    static var People: PeopleWrapper? = {
        do {
            let decoded = try JSONDecoder().decode(PeopleWrapper.self, from: PeopleRawData)
            return decoded
        } catch {
            print(error)
        }
        return nil
    }()

    /// A page of Peole data loaded in from local file in `Data` format.
    static var PersonRawData: Data = {
        guard let url = Bundle.main.url(forResource: "Person", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()

    /// A single Person instance from local file.
    static var Person: Person = {
        People?.results[0] ?? Person.empty()
    }()

    /// The "not found" response when requesting an out of bounds resource from the API
    static var NotFound: Data = {
        guard let url = Bundle.main.url(forResource: "NotFound", withExtension: "json") else {
            print("Failed find local JSON")
            return Data()
        }

        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error)
        }
        return Data()
    }()
}
