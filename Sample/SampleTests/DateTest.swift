//
//  DateTest.swift
//  SampleTests
//
//  Created by Philip Krück on 04.01.19.
//  Copyright © 2019 Tino Rachui. All rights reserved.
//

import XCTest

class DateTest: XCTestCase {

    func testCreateDateAtReferenceDate() {
        let date = Date(year: 1970, month: .january, day: 1, hour: 1, minute: 0, second: 0)
        let originalDate = Date(timeIntervalSince1970: 0.0)
        
        XCTAssertEqual(date, originalDate)        
    }
    
    func testCreateDateJanuary1st() {
        let date = Date(year: 1970, month: .january, day: 1, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 1
        dateComponents.month = 1
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateJanuaryLast() {
        let date = Date(year: 1970, month: .january, day: 31, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 31
        dateComponents.month = 1
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateFebruary1st() {
        let date = Date(year: 1970, month: .february, day: 1, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 1
        dateComponents.month = 2
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateFebruaryLast() {
        let date = Date(year: 1970, month: .february, day: 28, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 28
        dateComponents.month = 2
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    // Tino: Was passiert am 30. Febr?
    
    func testCreateDateMarch1st() {
        let date = Date(year: 1970, month: .march, day: 1, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 1
        dateComponents.month = 3
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateMarchLast() {
        let date = Date(year: 1970, month: .march, day: 31, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 31
        dateComponents.month = 3
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateApril1st() {
        let date = Date(year: 1970, month: .april, day: 1, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 1
        dateComponents.month = 4
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateAprilLast() {
        let date = Date(year: 1970, month: .april, day: 30, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 30
        dateComponents.month = 4
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateMay1st() {
        let date = Date(year: 1970, month: .may, day: 1, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 1
        dateComponents.month = 5
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateMayLast() {
        let date = Date(year: 1970, month: .may, day: 31, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 31
        dateComponents.month = 5
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateJune1st() {
        let date = Date(year: 1970, month: .june, day: 1, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 1
        dateComponents.month = 6
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateJuneLast() {
        let date = Date(year: 1970, month: .june, day: 30, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 30
        dateComponents.month = 6
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateJuly1st() {
        let date = Date(year: 1970, month: .july, day: 1, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 1
        dateComponents.month = 7
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateJulyLast() {
        let date = Date(year: 1970, month: .july, day: 31, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 31
        dateComponents.month = 7
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateAugust1st() {
        let date = Date(year: 1970, month: .august, day: 1, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 1
        dateComponents.month = 8
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateAugustLast() {
        let date = Date(year: 1970, month: .august, day: 31, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 31
        dateComponents.month = 8
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateSeptember1st() {
        let date = Date(year: 1970, month: .september, day: 1, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 1
        dateComponents.month = 9
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateSeptemberLast() {
        let date = Date(year: 1970, month: .september, day: 30, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 30
        dateComponents.month = 9
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateOctober1st() {
        let date = Date(year: 1970, month: .october, day: 1, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 1
        dateComponents.month = 10
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateOctoberLast() {
        let date = Date(year: 1970, month: .october, day: 31, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 31
        dateComponents.month = 10
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateNovember1st() {
        let date = Date(year: 1970, month: .november, day: 1, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 1
        dateComponents.month = 11
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateNovemberLast() {
        let date = Date(year: 1970, month: .november, day: 30, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 30
        dateComponents.month = 11
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateDecember1st() {
        let date = Date(year: 1970, month: .december, day: 1, hour: 0, minute: 0, second: 0)
        
        var dateComponents = setupDateComponents()
        dateComponents.day = 1
        dateComponents.month = 12
        let userCalendar = Calendar.current // user calendar
        let someDateTime = userCalendar.date(from: dateComponents)
        
        XCTAssertEqual(someDateTime, date)
    }
    
    func testCreateDateDecemberLast() {
        let date = Date(year: 1970, month: .december, day: 31, hour: 0, minute: 0, second: 0)
        
        let formattedDate = formatDate(for: date ?? Date())
                
        XCTAssertEqual(formattedDate, TimeConstants.DecemberLast1970)
    }
    
    // Tino: Eigentlich erzeugt die Methode eine DataComponents Instanz
    // und initialisiert sie mit bestimmten Werten. Das klingt für mich
    // eher nach einem 'convenience init' aus. 
    func setupDateComponents() -> DateComponents {
        var dateComponents = DateComponents()
        dateComponents.year = 1970
        dateComponents.timeZone = .current
        dateComponents.hour = 0
        dateComponents.minute = 0
        return dateComponents
    }
    
    // format date
    func formatDate(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        dateFormatter.locale = Locale(identifier: "en_US")
        
        return dateFormatter.string(from: date)
    }
}

extension DateComponents {
    
    /// Initializes DateComponents with day and month parameter. Year is set to 1970, hour and minute are set to 0, and timeZone is the current one.
    init(day: Int, month: Int) {
        self.init()
        self.day = day
        self.month = month
        self.year = 1970
        self.hour = 0
        self.minute = 0
        self.timeZone = .current
    }
}

struct TimeConstants {
    static let JanuaryFirst1970 = "Jan 1, 1970"
    static let DecemberLast1970 = "Dec 31, 1970"
}



