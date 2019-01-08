//
//  ArrayTest.swift
//  SampleTests
//
//  Created by Philip Krück on 03.01.19.
//  Copyright © 2019 Tino Rachui. All rights reserved.
//

import XCTest

class ArrayTest: XCTestCase {

    // MARK: test 'unique'
    func testUniqueArray() {
        var numbers = [1,2,2,2,3,3,3,4,4,5,5,6,6].unique.sorted()
        XCTAssertEqual(numbers, [1,2,3,4,5,6])
    }
    
    func testUniqueEmptyArray() {
        let emptyNumbers: [Int] = [].unique.sorted()
        XCTAssertEqual(emptyNumbers, [])
    }
    
    // MARK: test 'removeFirstOrNil'
    func testRemoveFirstOrNil() {
        var emptyArray: [String] = []
        XCTAssertNil(emptyArray.removeFirstOrNil())
        
        var numbers = [1,2,3,4,5]
        numbers.removeFirstOrNil()
        XCTAssertEqual(numbers, [2, 3, 4, 5])
    }

}
