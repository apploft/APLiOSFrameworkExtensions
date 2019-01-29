//
// Created by apploft on 18.12.18.
// Copyright © 2019 apploft GmbH￼￼
// MIT License · http://choosealicense.com/licenses/mit/ 

import UIKit

public extension UIButton {
    
    /// Set a state-dependent background color for a button. UIButton by default
    /// can only be configured with a state-dependent background image.
    /// - Parameter color: the color to set
    /// - Parameter forState: the state to set the color for
    public func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }
    
    /// Set a state-dependent gradient background color for a button.
    /// - Parameter startColor: the start color of the gradient color
    /// - Parameter endColor: the end color of the gradient color
    /// - Parameter forState: the state to set the color for
    public func setGradientBackgroundColor(startColor: UIColor, endColor: UIColor, forState: UIControl.State) {
        let gradientImage = self.gradientImage(startColor: startColor, endColor: endColor)
        
        setBackgroundImage(gradientImage, for: forState)
    }
    
    /// Given a start and an end color create a gradient image
    /// - Parameter startColor: the start color of the gradient color
    /// - Parameter endColor: the end color of the gradient color
    /// - Returns: a gradient image
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
        
        return image ?? UIImage()
    }
}
