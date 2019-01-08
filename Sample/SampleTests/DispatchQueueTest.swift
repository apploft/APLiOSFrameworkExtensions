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
        for i in 0...3 {
            DispatchQueue.once(token: "token") {
                number += 5
            }
        }
        XCTAssertEqual(number, 5)
    }

}
