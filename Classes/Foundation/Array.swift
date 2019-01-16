//
// Created by apploft on 18.12.18.
// Copyright © 2019 apploft GmbH. All rights reserved.

import Foundation

public extension Array where Element : Hashable {
    /// Returns a new array without duplicate elements.
    public var unique: [Element] {
        return Array(Set(self))
    }
}

public extension Array {
    /// Safely remove and return the first element if available.
    /// - Returns: the removed element or nil.
    public mutating func removeFirstOrNil() -> Element? {
        if isEmpty { return nil }
        return removeFirst()
    }
    /// Safely access collection elements.
    ///
    /// - Parameter index: the index of the element
    ///
    /**
     *Example*
     
     let array = ["a", "b"]
     array[2] // crashes
     array[safe: 2] // nil
     */
    public subscript (safe index: Index) -> Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
}
