//
// Created by apploft on 14.01.19.
// Copyright © 2019 apploft GmbH. All rights reserved.

import XCTest
@testable import APLiOSFrameworkExtensions

class ErrorTest: XCTestCase {

    func testErrorDomain() {
        XCTAssertEqual(APLError.errorDomain, "de.apploft")
    }
    
    func testAPLFileNotFoundRawValue() {
        XCTAssertEqual(APLError.fileNotFound.rawValue, 1000)
    }
    
    func testFileNotFoundNSErrorCode() {
        XCTAssertEqual(NSError.fileNotFound.code, APLError.fileNotFound.rawValue)
    }
    
    func testFileNotFoundNSErrorDomain() {
        XCTAssertEqual(NSError.fileNotFound.domain, APLError.errorDomain)
    }
    
    
    // @tino: Kann ich die folgenden 2 Funktionalitäten Error Extension so testen? Im Prinzip ist das ein 'cast' zwischen NSError und Error.
    func testErrorCodeFromNSError() {
        let error = NSError(domain: "de.apploft", code: 1000, userInfo: nil) as Error
        XCTAssertEqual(error.domain, APLError.errorDomain)
    }
    
    func testErrorDomainFromNSError() {
        let error = NSError(domain: "de.apploft", code: 1000, userInfo: nil) as Error
        XCTAssertEqual(error.domain, APLError.errorDomain)
    }
    

}
