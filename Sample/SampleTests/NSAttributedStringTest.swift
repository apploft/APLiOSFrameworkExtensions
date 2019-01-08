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
        let stringHello = NSAttributedString(string: "hello")
        let stringWorld = NSAttributedString(string: "world")
        XCTAssertEqual(stringHello.substituteText(with: "world"), stringWorld)
    }
    
    func testSubstituteColor() {
        
    }
    
    
}
