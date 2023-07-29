//
//  ListView+ViewModel.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/28/23.
//

import Foundation

extension ListView {
    final public class ViewModel: ObservableObject {
        @Published private(set) var people: [Person]
        @Published private(set) var isLoading = false

        private var request: APIRequest<PeopleResource>?

        init(people: [Person] = []) {
            self.people = people
            self.isLoading = false
            self.request = nil
        }

        func fetchPeople(forPage page: Int) {
            guard !isLoading else { return }
            isLoading = true

            let resource = PeopleResource(pageNumber: page)
            let request = APIRequest(resource: resource)
            self.request = request
            request.execute { [weak self] response in
                self?.people = response?.results ?? []
                self?.isLoading = false
            }
        }
    }
}
