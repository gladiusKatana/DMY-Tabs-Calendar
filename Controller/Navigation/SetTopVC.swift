//  SetTopVC.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension UIViewController {
    
    func setTopViewController() {
        
        if let viewControllers = self.navigationController?.viewControllers {// despite the s, should only contain 1 view controller...
            
            //print("view controllers: \(viewControllers)")
            
            guard viewControllers.count == 1 else {                          // ... this 1 view controller is the one showing
                
                print("\n\nnavigation controller, somehow, contains more than one view controller at once  ... vc count: \(viewControllers.count)   vcs: \(viewControllers)'\n\n")
                return
            }
            
            if let customVC = viewControllers[0] as? CollectionVC {
                currentTopVC = customVC
            }
                
            else {print("...could not cast vc within check of vc subclass")}
        }
    }
}









