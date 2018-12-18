//
//  String.swift
//

import Foundation
import UIKit

public extension NSAttributedString {
    func substitute(with substitution: String) -> NSAttributedString {
        let mutableCopy: NSMutableAttributedString = self.mutableCopy() as! NSMutableAttributedString
        
        mutableCopy.replaceCharacters(in: NSRange(location: 0, length: self.length), with: substitution)
        
        return mutableCopy
    }
    
    func substituteColor(with substitution: UIColor) -> NSAttributedString {
        guard self.length > 0 else {
            return self
        }
        
        let mutableCopy: NSMutableAttributedString = self.mutableCopy() as! NSMutableAttributedString
        let fullRange = NSRange(location: 0, length: self.length)
        
        mutableCopy.removeAttribute(.foregroundColor, range: fullRange)
        mutableCopy.addAttribute(.foregroundColor, value: substitution, range: fullRange)
        
        return mutableCopy
    }
}

