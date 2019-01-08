//
//  NSAttributedStringTest.swift
//  SampleTests
//
//  Created by Philip Krück on 04.01.19.
//  Copyright © 2019 Tino Rachui. All rights reserved.
//

import XCTest

class NSAttributedStringTest: XCTestCase {

    func testSubstituteText() {
        var stringHello = NSAttributedString(string: "hello")
        var stringWorld = NSAttributedString(string: "world")
        XCTAssertEqual(stringHello.substituteText(with: "world"), stringWorld)
    }
    
    func testSubstituteColor() {
        
    }
    
    
}
