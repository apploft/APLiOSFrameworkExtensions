//
//  Error.swift
//

import Foundation


/// Describes errors in the apploft error domain.
public struct APLError {
    
    /// The domain of the error.
    public static var errorDomain: String {
        return "de.apploft"
    }
    
    /// The error code itself.
    public struct Code : RawRepresentable, Hashable {
        
        /// The raw value to use for the new instance
        public let rawValue: Int
        
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        /// The hash value.
        ///
        /// Hash values are not guaranteed to be equal across different executions of
        /// your program. Do not save hash values to use during a future execution.
        public var hashValue: Int {
            return rawValue
        }
    }
}

extension APLError.Code {
    
    /// fileNotFound error code
    static var FileNotFound: APLError.Code {
        return APLError.Code(rawValue: 1000)
    }
}

public extension NSError {
    
    /// NSError using APLError structs variables for initializer parameters
    public static var fileNotFound: NSError {
        return NSError(domain: APLError.errorDomain, code: APLError.Code.FileNotFound.rawValue, userInfo: nil)
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
