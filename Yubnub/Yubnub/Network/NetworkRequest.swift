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
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) -> Void in
            guard
                let data = data,
                let value = self?.decode(data) else
            {
                DispatchQueue.main.async {
                    completion(nil) // Convert any errors to nil at this point. Better error handling to come.
                }
                return
            }
            // Send decoded value to completion
            DispatchQueue.main.async {
                completion(value)
            }
        }
        task.resume()
    }
}
