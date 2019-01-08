//
//  CollectionTest.swift
//  SampleTests
//
//  Created by Philip Krück on 04.01.19.
//  Copyright © 2019 Tino Rachui. All rights reserved.
//

import XCTest

class CollectionTest: XCTestCase {

    
    // For arrays the safe access method throws an error: "Cannot call value of non-function type '[Int]'"
    func testSafeArray() {
        let numbersArray = [1, 2, 3, 4]
        // XCTAssertEqual(1, numbersArray(safe: 0))
        // XCTAssertNil(numbersArray(safe: 4))
    }
    
    func testSafeDictionary() {
        var namesOfIntegers = [1: "one", 2: "two", 3: "three"]
        // XCTAssertEqual(namesOfIntegers(safe: 2), "two")
        // XCTAssertNil(namesOfIntegers(safe: 4))
    }
    
    func testSafeSet() {
        var favoriteGenres: Set = ["Indie", "Classical", "Hip hop"]
        XCTAssertEqual(favoriteGenres(safe: 2), "two")
        XCTAssertNil(favoriteGenres(safe: 4))
    }

}
