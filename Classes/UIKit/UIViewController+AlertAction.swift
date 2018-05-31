//
//  UIViewController+AlertAction.swift
//
//


import UIKit

struct AlertButton {
    let title: String
    let enabled: Bool
    let action: () -> Void
    var style: UIAlertActionStyle
    
    init(title: String, enabled: Bool = true, action: @escaping () -> Void = {}) {
        self.init(title: title, enabled: enabled, style: .default, action: action)
    }
    
    init(title: String, enabled: Bool = true, style: UIAlertActionStyle = .default, action: @escaping () -> Void = {}) {
        self.title = title
        self.action = action
        self.enabled = enabled
        self.style = style
    }
    
    static func okButton(enabled: Bool = true, action: @escaping () -> Void = {}) -> AlertButton {
        return AlertButton(title: NSLocalizedString("ok", comment: ""), enabled: enabled, action: action)
    }
    
    static func cancelButton(enabled: Bool = true, action: @escaping () -> Void = {}) -> AlertButton {
        return AlertButton(title: NSLocalizedString("cancel", comment: ""), enabled: enabled, action: action)
    }
}

extension UIViewController {
    func alert(title: String?, message: String?, cancelButton: AlertButton, otherButtons: [AlertButton]) {
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
    
    func alertOk(title: String?, message: String?, completionHandler: @escaping () -> Void) {
        let okButton = AlertButton(title: NSLocalizedString("ok", comment: ""), action: completionHandler)
        
        alert(title: nil, message: message, cancelButton: okButton, otherButtons: [])
    }
    
    func alertError(title: String?, message: String?, completionHandler: @escaping () -> Void = {}) {
        let okButton = AlertButton(title: NSLocalizedString("ok", comment: ""), action: completionHandler )
        
        alert(title: title, message: message, cancelButton: okButton, otherButtons: [])
    }
    
    func actionSheet(_ title: String? = nil, cancelButton: AlertButton? = nil, destructiveButton: AlertButton? = nil, otherButtons: [AlertButton] = [], _ portraitOnly: Bool = false) {
        let destructiveButtons = destructiveButton.map { [$0] } ?? []
        
        actionSheet(title, cancelButton: cancelButton, destructiveButtons: destructiveButtons, otherButtons: otherButtons, portraitOnly)
    }
    
    func actionSheet(_ title: String? = nil, cancelButton: AlertButton? = nil, destructiveButtons: [AlertButton] = [], otherButtons: [AlertButton] = [], _ portraitOnly: Bool = false) {
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


