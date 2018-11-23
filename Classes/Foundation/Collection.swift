//
//  Collection.swift
//

import Foundation

public extension Collection {

    /**
     Safely access collection elements.
     
     *Example*
     
     let array = ["a", "b"]
     
     array[2] // crashes
     
     array(safe: 2) // nil
     */
    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

}
