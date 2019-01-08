//
//  ArrayTest.swift
//  SampleTests
//
//  Created by Philip Krück on 03.01.19.
//  Copyright © 2019 Tino Rachui. All rights reserved.
//

import XCTest

class ArrayTest: XCTestCase {
    
    func testUniqueArray() {
        let numbers = [1,2,2,2,3,3,3,4,4,5,5,6,6].unique.sorted()
        XCTAssertEqual(numbers, [1,2,3,4,5,6])
    }
    
    func testUniqueEmptyArray() {
        let emptyNumbers: [Int] = [].unique.sorted()
        XCTAssertEqual(emptyNumbers, [])
    }
    
    func testRemoveFirstOrNilRemove() {
        var emptyArray: [String] = []
        XCTAssertNil(emptyArray.removeFirstOrNil())
    }
    
    func testRemoveFirstOrNilFirst() {
        var numbers = [1,2,3,4,5]
        _ = numbers.removeFirstOrNil()
        XCTAssertEqual(numbers, [2, 3, 4, 5])
    }
    
    func testSafeSubscriptingNil() {
        let numbers = [1, 2, 3, 4]
        XCTAssertNil(numbers[safe: 4])
    }
    
    func testSafeSubscriptingNotNil() {
        let numbers = [1, 2, 3, 4]
        XCTAssertNotNil(numbers[safe: 2])
    }

}
