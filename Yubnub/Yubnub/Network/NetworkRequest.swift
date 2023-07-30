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
    func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) -> Void in
            guard
                let data = data,
                let value = self?.decode(data) else
            {
                DispatchQueue.main.async {
                    print("NetworkRequest dataTask response: \(response?.description)")
                    print("NetworkRequest dataTask error: \(error)")
                    completion(nil) // Convert any errors to nil at this point. Better error handling to come.
                }
                return
            }
            // Send decoded value to completion
            DispatchQueue.main.async {
                print("NetworkRequest success response: \(response?.description)")
                completion(value)
            }
        }
        task.resume()
    }
}
