//
//  Credits:
//  Radiant Tap Essentials
//	https://github.com/radianttap/swift-essentials
//
//  Copyright © 2016 Radiant Tap
//  MIT License · http://choosealicense.com/licenses/mit/
//

import UIKit

public protocol StoryboardLoadable {
	static var storyboardName: String { get }
	static var storyboardIdentifier: String { get }
}

public extension StoryboardLoadable where Self: UIViewController {

    static var storyboardName: String {
		return String(describing: self)
	}

    static var storyboardIdentifier: String {
		return String(describing: self)
	}

    static func instantiate(fromStoryboardNamed name: String? = nil) -> Self {
		let storyB = name ?? self.storyboardName
		let storyboard = UIStoryboard(name: storyB, bundle: nil)
		return instantiate(fromStoryboard: storyboard)
	}

    static func instantiate(fromStoryboard storyboard: UIStoryboard) -> Self {
		let identifier = self.storyboardIdentifier
		guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
			fatalError("Failed to instantiate view controller with identifier=\(identifier) from storyboard \( storyboard )")
		}
		return viewController

	}
	
    static func initial(fromStoryboardNamed name: String? = nil) -> Self {
		let storyB = name ?? self.storyboardName
		let storyboard = UIStoryboard(name: storyB, bundle: nil)
		return initial(fromStoryboard: storyboard)
	}

    static func initial(fromStoryboard storyboard: UIStoryboard) -> Self {
		guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
			fatalError("Failed to instantiate initial view controller from storyboard named \( storyboard )")
		}
		return viewController
	}
}

extension UINavigationController: StoryboardLoadable {}
extension UITabBarController: StoryboardLoadable {}
extension UISplitViewController: StoryboardLoadable {}
extension UIPageViewController: StoryboardLoadable {}
