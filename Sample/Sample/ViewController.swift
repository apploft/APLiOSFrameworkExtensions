//
// Created by apploft on 18.12.18.
// Copyright © 2019 apploft GmbH.
// MIT License · http://choosealicense.com/licenses/mit/ 

import UIKit
import APLiOSFrameworkExtensions

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func showStoryboardLoadableViewController(_ sender: Any) {
        let vc = StoryboardLoadableViewController.instantiate()
        
        self.show(vc, sender: self)
    }
    
    @IBAction func showHideTabbar(_ sender: Any) {
        guard let tabBarController = self.tabBarController else { return }
        
        tabBarController.setTabBarVisible(!tabBarController.isTabBarVisible, animated: true)
    }
}

