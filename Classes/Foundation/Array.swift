//
//  Array.swift
//

import Foundation

public extension Array where Element : Hashable {
    /// Returns a new array without duplicate elements.
    public var unique: [Element] {
        return Array(Set(self))
    }

    /// Safely remove and return the first element if available.
    /// - Returns: the removed element or nil.
    public mutating func removeFirstOrNil() -> Element? {
        if isEmpty { return nil }
        return removeFirst()
    }
}
