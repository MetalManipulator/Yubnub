//
//  ListView+ViewModel.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/28/23.
//

import Foundation

extension ListView {
    final public class ViewModel: ObservableObject {
        @Published private(set) var people: [Person?] = []
        @Published private(set) var isLoading = false
        @Published private(set) var nextPage: Int? = 1

        private var request: APIRequest<PeopleResource>?
        private var session: URLSession

        init(session: URLSession = URLSession.shared) {
            self.request = nil
            self.session = session
        }

        /// Will request to fetch the next page of People
        func fetchNextPeoplePage() {
            if let nextPage = nextPage {
                fetchPeople(forPage: nextPage)
            } else {
                print("Reached end of pages")
            }
        }

        /// Fetches the desired page of People from the API
        /// - Parameter page: The page number to fetch
        fileprivate func fetchPeople(forPage page: Int) {
            guard !isLoading else { return }
            isLoading = true

            let resource = PeopleResource(pageNumber: page)
            let request = APIRequest(resource: resource)
            self.request = request

            request.execute(using: session) { [weak self] response in
                self?.isLoading = false
                self?.nextPage = response?.nextPage

                guard let results = response?.results else {
                    print("No people found")
                    return
                }

                // Initialize the Person array with empty objects to allow insertions
                if self?.people.isEmpty ?? true {
                    self?.people = .init(repeating: nil, count: 100)
                }

                // Add found people into the Person array
                for person in results {
                    self?.people[person.id] = person
                }
            }
        }
    }
}
