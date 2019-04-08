//  AppDelegate.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit 

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = navyBlue
        window?.makeKeyAndVisible()
        
        modelName = UIDevice.modelName; print("launching on \(modelName)")
        getOrientationAtLaunch()
        
        statusBar = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = .clear
        }
        
        UINavigationBar.appearance().barTintColor = icyBlue
        UINavigationBar.appearance().shadowImage = UIImage()
        
        return true
    }
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        backgroundVC.view.frame = globalKeyWindow.frame
        backgroundVC.view.backgroundColor = navyBlue
        
        navController = UINavigationController(rootViewController: backgroundVC)
        
        window?.rootViewController = navController                          //; print("VCs*: \(String(describing: nav Controller?.viewControllers))")
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            viewControllerOne.setupAndPresent(vc: viewControllerOne)//just need SOME uiviewcontroller to call this func., even if it's not in navController
        }
        
        return true
    }
}




