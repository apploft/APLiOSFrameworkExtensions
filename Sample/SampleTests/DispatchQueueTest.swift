//
//  DispatchQueueTest.swift
//  SampleTests
//
//  Created by Philip Krück on 04.01.19.
//  Copyright © 2019 Tino Rachui. All rights reserved.
//

import XCTest

class DispatchQueueTest: XCTestCase {

    func testOnceQueue() {
        var number = 0
        for _ in 0...3 {
            DispatchQueue.once(token: "com.apploft.token") {
                number += 5
            }
        }
        XCTAssertEqual(number, 5)
    }
    
    func testOnceQueueDiffBlock() {
        var number = 0
        var blockOne: () -> Void = {
            number += 5
        }
        var blockTwo: () -> Void = {
            number += 100
        }
        DispatchQueue.once(token: "com.apploft.token", block: blockOne)
        DispatchQueue.once(token: "com.apploft.token", block: blockTwo)
        
        XCTAssertEqual(number, 5)
    }
}
