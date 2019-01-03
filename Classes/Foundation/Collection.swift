//
//  Collection.swift
//

import Foundation

public extension Collection {
    
    /// Safely access collection elements.
    ///
    /// - Parameter index: the index of the element
    ///
    /**
     *Example*
     
     let array = ["a", "b"]
     array[2] // crashes
     array(safe: 2) // nil
     */
    public subscript (safe index: Index) -> Element? {
        guard indices.contains(index) else { return nil }
        
        return self[index]
    }

}
