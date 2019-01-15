//
//  URLSession.swift
//  SampleTests
//
//  Created by Philip Krück on 15.01.19.
//  Copyright © 2019 Tino Rachui. All rights reserved.
//

import XCTest

class URLSessionTest: XCTestCase {

    func testURLSessionSynchronousDataTask() {
        if let baconIpsumURL = URL(string: "https://baconipsum.com/api/?callback=?") {
            let request = URLRequest(url: baconIpsumURL)
            let (data, response, error) = URLSession.shared.synchronousDataTask(request: request)
            
            let allDataResponseParametersAreNil = (data == nil) && (response == nil) && (error == nil)
            XCTAssert(!allDataResponseParametersAreNil)
        }
    }

}
