//
//  UIControl.swift
//

import UIKit

public extension UIControl {

    public func setAction(for controlEvents: UIControl.Event = .primaryActionTriggered, action: @escaping () -> Void) {
        removeTarget(nil, action: nil, for: .allEvents)
        let sleeve = ClosureSleeve(attachTo: self, closure: action)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
    }

}

private class ClosureSleeve {

    let closure: () -> Void

    init(attachTo: AnyObject, closure: @escaping () -> Void) {
        self.closure = closure
        objc_setAssociatedObject(attachTo, "[\(arc4random())]", self, .OBJC_ASSOCIATION_RETAIN)
    }

    @objc func invoke() {
        closure()
    }

}
