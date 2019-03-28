//
//  Credits:
//  Radiant Tap Essentials
//    https://github.com/radianttap/swift-essentials
//
//  Copyright © 2016 Radiant Tap
//  MIT License · http://choosealicense.com/licenses/mit/
//
//    Uses: https://github.com/roberthein/TinyConstraints
import UIKit

public extension UIViewController {
    ///    (view, parentView) -> Void
    typealias LayoutBlock = (UIView, UIView) -> Void
    
    func embed<T>(controller viewController: T, into parentView: UIView?, layout: LayoutBlock = {
        viewController, parentViewController in
        viewController.leftAnchor.constraint(equalTo: parentViewController.leftAnchor).isActive = true
        viewController.rightAnchor.constraint(equalTo: parentViewController.rightAnchor).isActive = true
        viewController.topAnchor.constraint(equalTo: parentViewController.topAnchor).isActive = true
        viewController.bottomAnchor.constraint(equalTo: parentViewController.bottomAnchor).isActive = true        
        })
        where T: UIViewController {
        let container = parentView ?? self.view!
        
        addChild(viewController)
        container.addSubview(viewController.view)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        layout(viewController.view, container)
        viewController.didMove(toParent: self)
        
        //    Note: after this, save the controller reference
        //    somewhere in calling scope
    }
    
    func unembed(controller: UIViewController?) {
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
     Get reference on a specific child view controllers.
     
        *Example*
     
        var customChildViewController: CustomChildViewController { return child() }
     */
    func child<T: UIViewController>() -> T? {
        return children.filter { $0 is T }.first as? T
    }
    
}
