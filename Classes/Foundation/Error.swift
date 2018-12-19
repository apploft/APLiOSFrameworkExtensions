//
//  Error.swift
//

import Foundation

public extension Error {
    /// Assuming this is an instance of NSError return the 'code'
    public var code: Int {
        return (self as NSError).code
    }
    
    /// Assuming this is an instance of NSError return the 'domain'
    public var domain: String {
        return (self as NSError).domain
    }
}
