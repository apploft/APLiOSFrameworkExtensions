//
//  ErrorOptimized?.swift
//  APLiOSFrameworkExtensions
//
//  Created by Philip Krück on 09.01.19.
//

// maybe this makes more sense than Error.swift? idk

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
