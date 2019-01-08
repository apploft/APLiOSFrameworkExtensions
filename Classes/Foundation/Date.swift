//
//  Date.swift
//

import Foundation

public extension Date {
    enum Month: Int {
        case january = 1
        case feb = 2
    }
    /// A convenience initializer to create a date based on year, month, day etc. information
    /// Timezone und calendar
    /// - Parameter year: the year   0 - Int_Max
    /// - Parameter month: the month
    /// - Parameter day: the day       1 - 31
    /// - Parameter hour: the hour     0 - 23
    /// - Parameter minute: the minute 0 - 59
    /// - Parameter second: the second 0 - 59
    public init?(year: Int = 0, month: Month = .january, day: Int = 0, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        // Precondition check
        assert(day >= 0 && day < 32)
        
        var dateComponents = DateComponents()
        
        dateComponents.year = year
        dateComponents.month = month.rawValue
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.timeZone = TimeZone.current
        
        let calender = Calendar(identifier: .gregorian)

        if let date = calender.date(from: dateComponents) {
            self.init(timeInterval: 0, since: date)
        } else {
            return nil
        }                
    }
}
