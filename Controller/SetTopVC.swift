//  SetTopVC.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

extension UIViewController {
    
    func setTopViewController() {
        
        if let viewControllers = self.navigationController?.viewControllers { // despite the s, should only ever contain 1 view controller (the 'top' one)
            
            //print("view controllers: \(viewControllers)")
            
            guard viewControllers.count == 1 else {
                print("\n\nnavigation controller, somehow, contains more than one view controller in the stack at once  ... hmm, maybe I should go back to using storyboards after all  ... ...  nah     vc count: \(viewControllers.count)  vcs: \(viewControllers)'\n\n")
                return
            }
            
            if let customVC = viewControllers[0] as? CollectionVC {
                currentTopVC = customVC
            }
            else {print("...could not cast vc within check of vc subclass")}
        }
    }
}









