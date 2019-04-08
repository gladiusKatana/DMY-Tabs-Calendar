//  LaunchOrientation.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

extension AppDelegate {
    
    func getOrientationAtLaunch() {
        let launchHeight = Double(globalKeyWindow.frame.height) //; print("view frame height \(launchHeight)")
        launchWidth = Double(globalKeyWindow.frame.width)       //;  print("view frame width \(launchWidth)")
        
        if launchHeight > launchWidth {
            launchOrientation = "portrait"
            lastStatusBarHeight = 20
        }
        else if launchHeight < launchWidth {
            launchOrientation = "landscape"
            lastStatusBarHeight = 0
        }
        else {
            launchOrientation = " ?"
            lastStatusBarHeight = 99
        }
        currentOrientation = launchOrientation; previousOrientation = launchOrientation
        print("launched in \(launchOrientation)")
    }
}
