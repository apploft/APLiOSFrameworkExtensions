//
//  StringTest.swift
//  SampleTests
//
//  Created by Philip Krück on 11.01.19.
//  Copyright © 2019 Tino Rachui. All rights reserved.
//

import XCTest

class StringTest: XCTestCase {

    //: MARK: test 'stringByRemovingRegexMatches(pattern:replaceWith:)'
    func testStringRemoveRegexMatches() {
        let alphabetString = "abcdefghijk"
        XCTAssertEqual(alphabetString.removeRegexMatches(pattern: "d.*"), "abc")
    }
    
    func testStringRemoveRegexMatchesWithEmptyPattern() {
        let alphabetString = "abcdefghijk"
        XCTAssertEqual(alphabetString.removeRegexMatches(pattern: ".*"), "")
    }
    
    
    //: MARK: test 'capturedGroups(for:)'
    func testCapturedGroupsForMultipleCaptureGroups() {
        let alphabetString = "abcdefghijk"
        XCTAssertEqual(alphabetString.capturedGroups(for: "a(.*)d(.*)g(.*)k"), ["bc", "ef", "hij"])
    }
    
    func testCapturedGroupsForOneGroup() {
        let alphabetString = "abcdefghijk"
        XCTAssertEqual(alphabetString.capturedGroups(for: "e(.*)"), ["fghijk"])
    }
    
    func testCapturedGroupsForNoGrouop() {
        let alphabetString = "abcdefghijk"
        XCTAssertEqual(alphabetString.capturedGroups(for: "d(c.*)"), [])
    }

}
