//
//  SampleTests.swift
//  SampleTests
//
//  Created by Tino Rachui on 18.12.18.
//  Copyright © 2018 Tino Rachui. All rights reserved.
//

import XCTest
import APLiOSFrameworkExtensions

@testable import Sample

class SampleTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testColorBleding() {
        let red = UIColor.red
        let green = UIColor.green
        
        let blendetColor = UIColor.blend(color1: red, intensity1: 1.0, color2: green, intensity2: 0.5)
        
        XCTAssertNotNil(blendetColor)
    }
}
