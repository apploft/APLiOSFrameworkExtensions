//
//  UIViewController+AlertAction.swift
//
//


import UIKit

public struct AlertButton {
    public let title: String
    public let enabled: Bool
    public let action: () -> Void
    public var style: UIAlertAction.Style
    
    public init(title: String, enabled: Bool = true, action: @escaping () -> Void = {}) {
        self.init(title: title, enabled: enabled, style: .default, action: action)
    }
    
    public init(title: String, enabled: Bool = true, style: UIAlertAction.Style = .default, action: @escaping () -> Void = {}) {
        self.title = title
        self.action = action
        self.enabled = enabled
        self.style = style
    }
    
    public static func okButton(enabled: Bool = true, action: @escaping () -> Void = {}) -> AlertButton {
        return AlertButton(title: NSLocalizedString("ok", comment: ""), enabled: enabled, action: action)
    }
    
    public static func cancelButton(enabled: Bool = true, action: @escaping () -> Void = {}) -> AlertButton {
        return AlertButton(title: NSLocalizedString("cancel", comment: ""), enabled: enabled, action: action)
    }
}

public extension UIViewController {
    
    /// Convenience method in order to present an alert convenientyl from anywhere. The alert will only have
    /// an "Ok"-button. You can only configure 'title' and 'message'. The method automatically determines the
    /// top most visible view controller to present the alert.
    ///
    /// - Parameter title: the alert title
    /// - Parameter message: the message to show
    public class func presentAlert(withTitle title: String? = nil, message: String? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: NSLocalizedString("Ok", comment: "ok button"), style: .default, handler: nil)
            
            alertController.addAction(okAction)
            UIViewController.topViewController()?.present(alertController, animated: true, completion: nil)
        }
    }
    
    public func alert(title: String?, message: String?, cancelButton: AlertButton, otherButtons: [AlertButton]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: cancelButton.title, style: .cancel) { (action: UIAlertAction!) -> Void in
            cancelButton.action()
        }
        alertController.addAction(cancelAction)
        for button in otherButtons {
            let action = UIAlertAction(title: button.title, style: button.style) { (action) in
                button.action()
            }
            action.isEnabled = button.enabled
            alertController.addAction(action)
        }
        present(alertController, animated: true, completion: nil)
    }
    
    public func alertOk(title: String?, message: String?, completionHandler: @escaping () -> Void) {
        let okButton = AlertButton(title: NSLocalizedString("ok", comment: ""), action: completionHandler)
        
        alert(title: nil, message: message, cancelButton: okButton, otherButtons: [])
    }
    
    public func alertError(title: String?, message: String?, completionHandler: @escaping () -> Void = {}) {
        let okButton = AlertButton(title: NSLocalizedString("ok", comment: ""), action: completionHandler )
        
        alert(title: title, message: message, cancelButton: okButton, otherButtons: [])
    }
    
    public func actionSheet(_ title: String? = nil, cancelButton: AlertButton? = nil, destructiveButton: AlertButton? = nil, otherButtons: [AlertButton] = [], _ portraitOnly: Bool = false) {
        let destructiveButtons = destructiveButton.map { [$0] } ?? []
        
        actionSheet(title, cancelButton: cancelButton, destructiveButtons: destructiveButtons, otherButtons: otherButtons, portraitOnly)
    }
    
    public func actionSheet(_ title: String? = nil, cancelButton: AlertButton? = nil, destructiveButtons: [AlertButton] = [], otherButtons: [AlertButton] = [], _ portraitOnly: Bool = false) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        
        if let cancelButton = cancelButton {
            let action = UIAlertAction(title: cancelButton.title, style: .cancel) { (action) in
                cancelButton.action()
            }
            alertController.addAction(action)
        }
        
        for button in otherButtons {
            let action = UIAlertAction(title: button.title, style: .default) { (action: UIAlertAction!) -> Void in
                button.action()
            }
            action.isEnabled = button.enabled
            alertController.addAction(action)
        }
        
        for destructiveButton in destructiveButtons {
            let action = UIAlertAction(title: destructiveButton.title, style: .destructive) { (action) in
                destructiveButton.action()
            }
            action.isEnabled = destructiveButton.enabled
            alertController.addAction(action)
        }
        
        present(alertController, animated: true, completion: nil)
    }
}


