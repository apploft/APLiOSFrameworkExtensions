//
//  Collection.swift
//

import Foundation

public extension Collection {

    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

}
