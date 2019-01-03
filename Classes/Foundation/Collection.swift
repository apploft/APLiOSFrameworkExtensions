//
//  Collection.swift
//

import Foundation

public extension Collection {
    
    /// Safely access collection elements.
    ///
    /// - Parameter index: the index of the element
    public subscript (safe index: Index) -> Element? {
        guard indices.contains(index) else { return nil }
        
        return self[index]
    }

}
