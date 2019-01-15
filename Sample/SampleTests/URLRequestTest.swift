//
//  URLRequestTest.swift
//  SampleTests
//
//  Created by Philip Krück on 14.01.19.
//  Copyright © 2019 Tino Rachui. All rights reserved.
//

import XCTest

class URLRequestTest: XCTestCase {
    
    var baconIpsumURL = URL(string: "https://baconipsum.com/api/?callback=?")

    func testParameterForURLRequestWithNoAdditionalParameters() {
        if let baconIpsumURL = baconIpsumURL {
            let request = URLRequest(url: baconIpsumURL)
            XCTAssertEqual(["callback": "?"], request.parameters)
        }
    }
    
    func testParameterForURLRequestWithAdditionalParameters() {
        if let baconIpsumURL = baconIpsumURL {
            var request = URLRequest(url: baconIpsumURL)
            
            // Wie kann ich headers zum urlrequest hinzufügen?
            request.setValue("all-meat", forHTTPHeaderField: "type")

            //XCTAssertEqual(request.parameters, ["callback": "?", "type": "all-meat"])
        }
    }
    
    func checkIfTwoURLRequestsAreEqual() {
        if let baconIpsumURL = baconIpsumURL {
            let request1 = URLRequest(url: baconIpsumURL)
            let request2 = URLRequest(url: baconIpsumURL)
            XCTAssert(request1.isEqual(to: request2))
        }
    }

}

