//
//  URLProtocolStub.swift
//  Yubnub
//
//  Created by Levi Gustin on 8/12/23.
//
// Referenced from: https://www.hackingwithswift.com/articles/153/how-to-test-ios-networking-code-the-easy-way

import Foundation

class URLProtocolStub: URLProtocol {
    // Dictionary that maps URLs to test data
    static var testURLs = [URL?: Data]()

    // We want to handle all types of requests
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    // Ignore this method; just send back what we are given
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        // Valid URL
        if let url = request.url {
            // We have test data for that URL
            if let data = URLProtocolStub.testURLs[url] {
                // Load it immediately
                self.client?.urlProtocol(self, didLoad: data)
            }
        }

        // Mark that we've finished
        self.client?.urlProtocolDidFinishLoading(self)
    }

    // Required but doesn't need to do anything
    override func stopLoading() { }
}
