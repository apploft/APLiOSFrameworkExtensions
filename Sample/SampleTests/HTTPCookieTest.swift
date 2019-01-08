//
//  HTTPCookieTest.swift
//  SampleTests
//
//  Created by Philip Krück on 04.01.19.
//  Copyright © 2019 Tino Rachui. All rights reserved.
//

import XCTest

class HTTPCookieTest: XCTestCase {

    // create an HTTP cookie and call javaScriptString on it, then assert equal result to expected hardcoded key-value pair string
    
    func testJavaScriptString() {
        var httpCookie: HTTPCookie! = HTTPCookie(properties: [
            .domain: "someDomain",
            .path: "somePath",
            .name: "someName",
            .secure: "TRUE",
            .value: "someValue",
            .originURL: "someOriginURL"
            ])
        XCTAssertEqual(httpCookie.javaScriptString, "someName=someValue; domain=somedomain; path=somePath; secure=true")
    }
}
