//
//  Date.swift
//

import Foundation

public extension Date {
    enum Month: Int {
        case january = 1
        case february = 2
        case march = 3
        case april = 4
        case may = 5
        case june = 6
        case july = 7
        case august = 8
        case september = 9
        case october = 10
        case november = 11
        case december = 12
    }
    
    static let MaxPossibleYear = 4409620
    
    /// A convenience initializer to create a date based on year, month, day, minute and second information
    /// - Parameter year: the year (value range: 0 - MaxPossibleYear)
    /// - Parameter month: the month (possibilites specified by 'Month' enum)
    /// - Parameter day: the day (value range: 0 - 31)
    /// - Parameter hour: the hour  (value range: 0 - 23)
    /// - Parameter minute: the minute (value range: 0 - 59)
    /// - Parameter second: the second (value range: 0 - 59)
    ///
    /// The 'calendar' parameter of DateComponents is set to '.gregorian'and the 'timeZone' parameter is set to '.current' in the method implementation.
    ///
    /// Declaring a date with a day larger than defined in the gregorian calendar system (but still in above specified value range) will create a date in the following month.
    /**
     // e.g.
     Date(year: 1970, month: .february, day: 29, hour: 0, minute: 0, second: 0) // --> March 1
     Date(year: 1970, month: .february, day: 30, hour: 0, minute: 0, second: 0) // --> March 2
     */
    public init?(year: Int = 0, month: Month = .january, day: Int = 0, hour: Int = 0, minute: Int = 0, second: Int = 0) {
        // Precondition check
        assert(year >= 0 && year <= Date.MaxPossibleYear)
        assert(day >= 0 && day <= 31)
        assert(hour >= 0 && hour <= 23)
        assert(minute >= 0 && minute <= 59)
        assert(second >= 0 && second <= 59)
        
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
