//
//  URLSession.swift
//  APLiOSFrameworkExtensions
//
//  Created by Tino Rachui on 19.12.18.
//

import Foundation

public extension URLSession {
    /// Synchronously load data. Note that this function blocks the calling thread until
    /// the load has completed or timed out.
    /// - Parameter request: the url load request
    /// - Returns: the result of the url request
    public func synchronousDataTask(request: URLRequest) -> (Data?, URLResponse?, Error?) {
        var data: Data?, response: URLResponse?, error: Error?
        
        let semaphore = DispatchSemaphore(value: 0)
        
        dataTask(with: request) {
            data = $0
            response = $1
            error = $2
            semaphore.signal()
            }.resume()
        
        semaphore.wait()
        
        return (data, response, error)
    }
}
