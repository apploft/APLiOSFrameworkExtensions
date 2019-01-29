//
//    Credits:
//    Stefano Vettor
//    https://gist.github.com/freedom27/c709923b163e26405f62b799437243f4

import UIKit

extension CAShapeLayer {
    func drawRoundedRect(_ rect: CGRect, _ color: UIColor, _ isFilled: Bool) {
        fillColor = isFilled ? color.cgColor : UIColor.white.cgColor
        strokeColor = color.cgColor
        path = UIBezierPath(roundedRect: rect, cornerRadius: 7).cgPath
    }
}

private var badgeShapeLayerAssociationKey: UInt8 = 0
private var badgeTextLayerAssociationKey: UInt8 = 1

public extension UIBarButtonItem {
    private var badgeShapeLayer: CAShapeLayer? {
        if let badge: AnyObject = objc_getAssociatedObject(self, &badgeShapeLayerAssociationKey) as AnyObject? {
            return badge as? CAShapeLayer
        } else {
            return nil
        }
    }
    
    private var badgeTextLayer: CATextLayer? {
        if let badge: AnyObject = objc_getAssociatedObject(self, &badgeTextLayerAssociationKey) as AnyObject? {
            return badge as? CATextLayer
        } else {
            return nil
        }
    }
    
    // Remove all layers from the layer hierarchy
    @objc public func removeBadge() {
        badgeShapeLayer?.removeFromSuperlayer()
    }
    
    @objc public func setBadge(text: String = "",
                               badgeSize: CGSize = CGSize(width: 20.0, height: 20.0),
                               badgeOrigin: CGPoint = CGPoint.zero,
                               color: UIColor = UIColor.red,
                               isFilled: Bool = true,
                               fontSize: CGFloat = 12) {
        self.removeBadge()
        if text.isEmpty {
            return
        }
        
        guard let view = self.value(forKey: "view") as? UIView else { return }
        
        let font = UIFont.systemFont(ofSize: fontSize)
        let textSize = text.size(withAttributes: [NSAttributedString.Key.font: font])
        
        // Create badge layer
        let badgeShapeLayer = CAShapeLayer()
        let badgeFrame = CGRect(origin: CGPoint(x: badgeOrigin.x, y: -badgeOrigin.y), size: badgeSize)
        badgeShapeLayer.drawRoundedRect(badgeFrame, color, isFilled)
        view.layer.addSublayer(badgeShapeLayer)
        
        // Create label layer
        let labelTextLayer = CATextLayer()
        labelTextLayer.string = text
        labelTextLayer.alignmentMode = CATextLayerAlignmentMode.center
        labelTextLayer.font = font
        labelTextLayer.fontSize = font.pointSize
        labelTextLayer.foregroundColor = isFilled ? UIColor.white.cgColor : color.cgColor
        labelTextLayer.backgroundColor = UIColor.clear.cgColor
        labelTextLayer.contentsScale = UIScreen.main.scale
        
        labelTextLayer.frame = CGRect(origin: CGPoint(x: badgeOrigin.x + (badgeSize.width-textSize.width)*0.5,
                                                      y: -(badgeOrigin.y - (badgeSize.height-textSize.height)*0.5)),
                                      size: textSize)
        
        badgeShapeLayer.addSublayer(labelTextLayer)
        
        // Save as UIBarButtonItem properties
        objc_setAssociatedObject(self, &badgeShapeLayerAssociationKey, badgeShapeLayer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        objc_setAssociatedObject(self, &badgeTextLayerAssociationKey, labelTextLayer, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    @objc public func isHidden(_ isHidden: Bool) {
        badgeShapeLayer?.isHidden = isHidden
    }
    
    @objc public func updateBadge(text: String = "") {
        if let badgeShapeLayerPath = badgeShapeLayer?.path, let badgeTextLayer = badgeTextLayer, let font = badgeTextLayer.font {
            let textSize = text.size(withAttributes: [NSAttributedString.Key.font: font])
            let badgeOrigin: CGPoint = badgeShapeLayerPath.boundingBox.origin
            let badgeSize: CGSize = badgeShapeLayerPath.boundingBox.size
            badgeTextLayer.string = text
            badgeTextLayer.frame = CGRect(origin: CGPoint(x: badgeOrigin.x + (badgeSize.width-textSize.width)*0.5,
                                                          y: badgeTextLayer.frame.origin.y),
                                          size: textSize)
        }
    }
}
