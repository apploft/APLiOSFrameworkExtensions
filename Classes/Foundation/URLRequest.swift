//
// Created by apploft on 18.12.18.
// Copyright © 2019 apploft GmbH. All rights reserved.

import Foundation

public extension URLRequest {
    
    /// Return a dictionary of all parameter (query and body) of an URLRequest. 
    public var parameters: [String: String] {
        var parameters = [String: String]()
        var parameterString = url?.query ?? ""
        
        if let httpBody = httpBody {
            parameterString = [parameterString, String(data: httpBody, encoding: .utf8).valueOrEmpty()].filter({ !$0.isEmpty }).joined(separator: "&")
        }
        
        parameterString.split(separator: "&").forEach { pair in
            let keyValue = pair.split(separator: "=").map { String($0) }
            guard keyValue.count == 2 else { return }
            
            parameters[keyValue[0]] = keyValue[1]
        }
        
        return parameters
    }
    
    /// Determine if two instances of URLRequest are equal.
    /// - Parameter to: the other instance. May be nil
    /// - Returns: true if both instances are equal, false otherwise
    public func isEqual(to: URLRequest?) -> Bool {
        guard let to = to else { return false }
        return (url == to.url) && (httpMethod == to.httpMethod) && (httpBody == to.httpBody) && (httpBodyStream == to.httpBodyStream)
    }
    
}
