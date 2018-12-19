//
//  Date.swift
//

import Foundation

public extension Date {
    /// A convenience initializer to create a date based on year, month, day etc. information
    /// - Parameter year: the year
    /// - Parameter month: the month
    /// - Parameter day: the day
    /// - Parameter hour: the hour
    /// - Parameter minute: the minute
    /// - Parameter second: the second
    public init(year: Int = 0, month: Int = 0, day: Int = 0, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.timeZone = TimeZone.current
        let calender = Calendar(identifier: .gregorian)
        let date = calender.date(from: dateComponents) ?? Date()
        
        self.init(timeInterval: 0, since: date)
    }
    
}
