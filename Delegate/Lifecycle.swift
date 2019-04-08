//  Lifecycle.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit 

extension AppDelegate {
    
    func applicationDidBecomeActive(_ application: UIApplication) {              
        pryntApplicationStatusWithSpaces(applicationState: "became active")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        pryntApplicationStatusWithSpaces(applicationState: "will resign active")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        pryntApplicationStatusWithSpaces(applicationState: "entered background")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        pryntApplicationStatusWithSpaces(applicationState: "will enter foreground")
        
        willPresentVCAgainBecauseAppJustEnteredForeground = true // note, this bool (currently) is one-way: never flips back to false...
    }//                                                     // ...because calling the above 2 methods causes a layout exception during the whole life cycle
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("terminated")
    }
    
    
    func pryntApplicationStatusWithSpaces(applicationState: String) {
        print("\n[\(applicationState)]")
    }
}
