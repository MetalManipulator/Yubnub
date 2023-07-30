//
//  ListView+ViewModel.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/28/23.
//

import Foundation

extension ListView {
    final public class ViewModel: ObservableObject {
        @Published private(set) var people: [Person?]
        @Published private(set) var isLoading = false
        @Published private(set) var nextPage: Int? = 1

        private var request: APIRequest<PeopleResource>?

        init(people: [Person] = []) {
            self.people = people
            self.isLoading = false
            self.request = nil
        }

        func fetchNextPeoplePage() {
            print("fetchNextPeoplePage: \(nextPage)")
            if let nextPage = nextPage {
                fetchPeople(forPage: nextPage)
            } else {
                print("Reached end of pages")
            }
        }

        func fetchPeople(forPage page: Int) {
            guard !isLoading else { return }
            isLoading = true

            let resource = PeopleResource(pageNumber: page)
            let request = APIRequest(resource: resource)
            self.request = request
            request.execute { [weak self] response in
                self?.isLoading = false
                self?.nextPage = response?.nextPage

                guard let results = response?.results else {
                    print("No people found")
                    return
                }

                if self?.people.isEmpty ?? true {
                    self?.people = .init(repeating: nil, count: 100)
                }

                for person in results {
                    self?.people[person.id] = person
                }
            }
        }
    }
}
