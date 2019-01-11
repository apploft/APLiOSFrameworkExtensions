//
//  DispatchQueueTest.swift
//  SampleTests
//
//  Created by Philip Krück on 04.01.19.
//  Copyright © 2019 Tino Rachui. All rights reserved.
//

import XCTest

class DispatchQueueTest: XCTestCase {

    func testDispatchQueueExecutesBlockOnce() {
        var number = 0
        for _ in 0...3 {
            DispatchQueue.once(token: "com.apploft.token") {
                number += 5
            }
        }
        XCTAssertEqual(number, 5)
    }
    
    func testDispatchQueueExecutesOnceWithUniqueToken() {
        var number = 0
        let blockOne: () -> Void = {
            number += 5
        }
        let blockTwo: () -> Void = {
            number += 100
        }
        DispatchQueue.once(token: "com.apploft.token2", block: blockOne)
        DispatchQueue.once(token: "com.apploft.token2", block: blockTwo)
        
        XCTAssertEqual(number, 5)
    }
}
