//
//  DateTest.swift
//  SampleTests
//
//  Created by Philip Krück on 04.01.19.
//  Copyright © 2019 Tino Rachui. All rights reserved.
//

import XCTest

class DateTest: XCTestCase {

    func testDateInitializer() {
        let date = Date(year: 1970, month: 1, day: 1, hour: 1, minute: 0, second: 0)
        let originalDate = Date(timeIntervalSince1970: TimeInterval(exactly: 0)!)

        
        XCTAssertEqual(date, originalDate)
    }
    
    // Date() uses init() defined by Apple which creates a date value based on the current date and time
    // Therefore, one cannot initialize a date to year: 0, month: 0, day: 0, hour: 0, minute: 0, second: 0 from our Date extension initializer
    func testDateDefaultInitializer() {
        let date = Date() // init defined in extension should set
        print()
        print(date)
        
        let originalDate = Date(year: 0, month: 0, day: 0, hour: 0, minute: 0, second: 0)
        print(originalDate)
        XCTAssertEqual(date, originalDate)
    }
    
    func testDateDefaultInitializerFor() {
        let date = Date(year: 1)
        let originalDate = Date(year: 1, month: 0, day: 0, hour: 0, minute: 0, second: 0)
        
        XCTAssertEqual(date, originalDate)
    }
    
    
    // MARK: limits
    
    /*
    do limits exist:
    limits for year? limit < 0
    month > 12? month < 0?
    day > 31? day < 0?
    day > 28 in Feb
    day = 29 in leap years possible?
    hour > 24? hour < 0?
    minute > 60? minute < 0?
    second > 60? second < 0?
    */
    
    // year
    func testLimitYear() {
        let date = Date(year: 10000000000, month: 1, day: 1, hour: 1, minute: 1, second: 1)
        print()
        print(date)
        XCTAssert(true)
    }
    
    // month
    func testMonthLimit() {
        let date = Date(month: 13)
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        XCTAssertLessThan(month, 13, "month can't be greater than 12")
    }
    
    func testMonthLessNegative() {
        let date = Date(month: -2)
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        XCTAssertGreaterThan(month, 0, "month can't be negative")
    }
    
    
    // day
    func testDayLimit() {
        let date = Date(day: 32)
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        XCTAssertLessThan(day, 32, "day can't be greater than 12")
    }
    
    func testDayLessNegative() {
        let date = Date(day: -2)
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        XCTAssertGreaterThan(day, 0, "day can't be negative")
    }
    
    
    // hour
    func testHourLimit() {
        let date = Date(hour: 25)
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        XCTAssertLessThan(hour, 25, "hour can't be greater than 12")
    }
    
    func testHourNegative() {
        let date = Date(hour: -1)
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        XCTAssertGreaterThan(hour, -1, "hour can't be negative")
    }

    
    // second
    func testSecondLimit() {
        let date = Date(second: 61)
        let calendar = Calendar.current
        let second = calendar.component(.second, from: date)
        XCTAssertLessThan(second, 61, "second can't be greater than 12")
    }
    
    func testMonthNegative() {
        let date = Date(second: -1)
        let calendar = Calendar.current
        let second = calendar.component(.second, from: date)
        XCTAssertGreaterThan(second, -1, "second can't be negative")
    }
    
    func testNonLeapYear() {
        let date = Date(year: 2018, month: 2, day: 29) // not a leap year
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        XCTAssertLessThan(day, 29, "In years which aren't leap years, days should be less than 29")
    }
    
    func testLeapYear() {
        let date = Date(year: 2020, month: 2, day: 29)
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        XCTAssertEqual(day, 29)
    }
    
    

}
