//
//  StringLoading.swift
//

import Foundation


public extension String {
    /// Initialize a string with the content of a resource specified by the given url. This is
    /// a failable initializer.
    /// - Parameter contentsOf: the url to load from
    /// - Parameter headerFields: specific http header fields to be used for the load
    /// - Parameter maxLength: the maximum length of the created string
    public init?(contentsOf url: URL, headerFields: [String: String]? = nil, maxLength: Int? = nil) {
        var request = URLRequest(url: url)
        
        for (key, value) in headerFields ?? [:] {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        let result = URLSession.shared.synchronousDataTask(request: request)
        
        if let data = result.0 {
            if let maxLength = maxLength {
                let upperBound = "".min(maxLength, data.count)
                let subData = data.subdata(in: (0..<upperBound))
                
                self.init(data: subData, encoding: .utf8)
            } else {
                self.init(data: data, encoding: .utf8)
            }
        } else {
            return nil
        }
    }
}


