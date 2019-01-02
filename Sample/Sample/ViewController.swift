//
//  ViewController.swift
//  Sample
//
//  Created by Tino Rachui on 18.12.18.
//  Copyright © 2018 Tino Rachui. All rights reserved.
//

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

