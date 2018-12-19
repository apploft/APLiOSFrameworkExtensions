//
//  String.swift
//

import Foundation

public extension String {
    /// Create a new string by replacing certain regex patters with another string.
    /// - Parameter pattern: the regex pattern to replace
    /// - Parameter replaceWith: the replacement string
    /// - Returns: a string with the specified pattern matches replaced
    public func stringByRemovingRegexMatches(pattern: String, replaceWith: String = "") -> String {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, self.count)
            return regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replaceWith)
        } catch {
            return self
        }
    }
    
    /// Determine the capture groups for a given regex.
    /// - Parameter regex: the regular expression
    /// - Returns: an array of the capture groups corresponding to the regex
    public func capturedGroups(for regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let nsString = self as NSString
            let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
            var resultsFinal = [String]()
            for result in results {
                for i in 1 ..< result.numberOfRanges {
                    resultsFinal.append(nsString.substring(with: result.range(at: i)))
                }
            }
            return resultsFinal
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
}
