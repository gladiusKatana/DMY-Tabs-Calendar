//  Present&Reload.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    @objc func reloadAfterPreparingVCAndPossiblyPresentingItAgain(vc: CollectionVC) {
        
        if previousOrientation == "landscape" && currentOrientation == "portrait"
            || willPresentVCAgainBecauseAppJustEnteredForeground {
            rePresentedVCFromButton = false
            //print(substringWithAppends(input: vc.navBarTitle, preceding: "\n----------------------presented then reloaded cv ", following:  ""))
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                previousOrientation = currentOrientation
                reloadCV(after: 0.02)
            }
        } else {
            previousOrientation = currentOrientation
            reloadCollectionView()  // should it have a time delay, as in the above completion block? (will test over time, with different devices)
            //reloadCV(after: 0.02)
        }
    }
    
    func gotoView(vc: CollectionVC) {                                                               //print("\nshowing vc \(vc)")
        if currentTopVC != vc {
            checkOrientation()
            
            setupTitleAndPresentViewController(vc: vc) { () -> () in
                if currentOrientation == "landscape" {                                              //print("pushed button when in landscape")
                    reloadCV(after: 0.02)
                }
                //else {print("just did goto from portrait")}
            }
        } else {print(substringWithAppends(input: vc.navBarTitle, preceding: "you're already looking at view controller ", following: "'s view"))}
    }
    
    func setupTitleAndPresentViewController(vc: CollectionVC, completion: () -> ()) {               //print("\ndismissing/presenting") // vc: \(vc)
        setupAndPresent(vc: vc)
        completion()
    }
    
    func setupAndPresent(vc: CollectionVC) {
        setupViewTitle(titleText: "", numLines: 1, alignment: .left)
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.dismissNavController {
                let newVC = UINavigationController(rootViewController: vc)
                navController?.present(newVC, animated: false, completion: nil)
            }
        }
    }
    
    func dismissNavController(completion: @escaping () -> ()) {
        navController?.dismiss(animated: false, completion: nil)
        completion()
    }
}
