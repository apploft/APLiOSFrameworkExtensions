//
//  Embeddable.swift
//  Radiant Tap Essentials
//    https://github.com/radianttap/swift-essentials
//
//  Copyright © 2016 Radiant Tap
//  MIT License · http://choosealicense.com/licenses/mit/
//
//    Uses: https://github.com/roberthein/TinyConstraints
import UIKit

extension UIViewController {
    ///    (view, parentView) -> Void
    public typealias LayoutBlock = (UIView, UIView) -> Void
    
    public func embed<T>(controller vc: T, into parentView: UIView?, layout: LayoutBlock = {
        v, pv in
        v.leftAnchor.constraint(equalTo: pv.leftAnchor).isActive = true
        v.rightAnchor.constraint(equalTo: pv.rightAnchor).isActive = true
        v.topAnchor.constraint(equalTo: pv.topAnchor).isActive = true
        v.bottomAnchor.constraint(equalTo: pv.bottomAnchor).isActive = true        
        })
        where T: UIViewController
    {
        let container = parentView ?? self.view!
        
        addChild(vc)
        container.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        layout(vc.view, container)
        vc.didMove(toParent: self)
        
        //    Note: after this, save the controller reference
        //    somewhere in calling scope
    }
    
    public func unembed(controller: UIViewController?) {
        guard let controller = controller else { return }
        
        controller.willMove(toParent: nil)
        if controller.isViewLoaded {
            controller.view.removeFromSuperview()
        }
        controller.removeFromParent()
        
        //    Note: don't forget to nullify your own controller instance
        //    in order to clear it out from memory
    }
    
    /**
     Get quick reference on child view controllers added via storyboard.
     
     *Example*
     
     var customChildViewController: CustomChildViewController { return child() }
     */
    public func child<T: UIViewController>() -> T? {
        return children.filter { $0 is T }.first as? T
    }
    
}
