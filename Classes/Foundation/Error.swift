//
// Created by apploft on 18.12.18.
// Copyright © 2019 apploft GmbH. All rights reserved.

import Foundation


enum APLError: Int, Error {
    public static var errorDomain: String {
        return "de.apploft"
    }
    
    case fileNotFound = 1000
}


public extension NSError {
    /// custom fileNotFound error
    public static var fileNotFound: NSError {
        return NSError(domain: APLError.errorDomain, code: APLError.fileNotFound.rawValue, userInfo: nil)
    }
}


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
