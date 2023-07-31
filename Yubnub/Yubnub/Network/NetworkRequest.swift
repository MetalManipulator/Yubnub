//
//  NetworkRequest.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/27/23.
//

import Foundation

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func execute(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
    /// Called by the API layer to do the actual request and response handling
    /// - Parameters:
    ///   - url: The url of the request to be completed
    ///   - completion: The closure to be called with the results of the request
    func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) -> Void in
            guard
                let data = data,
                let value = self?.decode(data) else
            {
                // Handle errors
                DispatchQueue.main.async {
                    print("NetworkRequest dataTask response: \(response.debugDescription)")
                    print("NetworkRequest dataTask error: \(error.debugDescription)")
                    completion(nil) // Convert any errors to nil at this point. Better error handling to come.
                }
                return
            }
            // Send decoded value to completion
            DispatchQueue.main.async {
                print("NetworkRequest success for: \(url.absoluteString)")
                completion(value)
            }
        }
        task.resume()
    }
}
