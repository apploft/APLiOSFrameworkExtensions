//
//  UIViewController.swift
//

import UIKit

public extension UIButton {
    
    public func setBackgroundColor(color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }
    
    public func setGradientBackgroundColor(startColor: UIColor, endColor: UIColor, forState: UIControlState) {
        let gradientImage = self.gradientImage(startColor: startColor, endColor: endColor)
        
        setBackgroundImage(gradientImage, for: forState)
    }
    
    func gradientImage(startColor: UIColor, endColor: UIColor) -> UIImage {
        let gradientLayer = CAGradientLayer()
        let bounds = CGRect(x: 0, y: 0, width: 1.0, height: 44.0)
        
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.bounds = bounds
        
        UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size, true, 0.0)
        
        let context = UIGraphicsGetCurrentContext()
        
        gradientLayer.render(in: context!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
    }
}
