//
//  UIColor.swift
//

import UIKit

public extension UIColor {
    /// Create a color by blending two colors.
    /// - Parameter color1: the first color
    /// - Parameter intensity1: the intensity of color 1
    /// - Parameter color2: the second color
    /// - Parameter intensity2: the intensity of color 2
    /// - Returns: the blendet color
    static func blend(color1: UIColor, intensity1: CGFloat = 0.5, color2: UIColor, intensity2: CGFloat = 0.5) -> UIColor {
        let total = intensity1 + intensity2
        let l1 = intensity1/total
        let l2 = intensity2/total
        guard l1 > 0 else { return color2}
        guard l2 > 0 else { return color1}
        var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        
        color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        return UIColor(red: l1*r1 + l2*r2, green: l1*g1 + l2*g2, blue: l1*b1 + l2*b2, alpha: l1*a1 + l2*a2)
    }
    
    /// Create a color lighter by percentage than the original color.
    /// - Parameter percentage: the percentage by which the color should be lighter
    /// - Returns: a lighter color
    public func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    /// Create a color darker by percentage than the original color.
    /// - Parameter percentage: the percentage by which the color should be darker
    /// - Returns: a darker color
    public func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    /// Adjust all color components by a certain percentage.
    /// - Parameter percentage: the percentage by which to adjust the color coponents.
    /// - Returns: a color adjusted by a certain percentage
    public func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}

public extension UIColor {
    /// Make an image out of a color.
    /// - Parameter size: the size of the resulting image.
    /// - Returns: the image created from the color
    public func toImage(withSize size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIGraphicsBeginImageContext(size)
        image?.draw(in: rect)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image ?? UIImage()
    }
    
}

public extension UIColor {
    /// Convenience initializer to create a color with a hex value
    /// - Parameter hex: the hex value
    /// - Parameter alpha: the alpha value
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    /// Return the hex string corresponding to the color instance.
    var hexString: String {
        let components = self.cgColor.components
        let red = Float((components?[0])!)
        let green = Float((components?[1])!)
        let blue = Float((components?[2])!)
        
        return String(format: "#%02lX%02lX%02lX", lroundf(red * 255), lroundf(green * 255), lroundf(blue * 255))
    }
}
