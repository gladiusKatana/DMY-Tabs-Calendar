//  ExtraPresent&Reload.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    @objc func reloadAfterPreparingVCAndPossiblyPresentingItAgain(vc: CollectionVC) {
        
        if previousOrientation == "landscape" && currentOrientation == "portrait"
            || willPresentVCAgainBecauseAppJustEnteredForeground {
            
            rePresentedVCFromButton = false
            print(substringWithAppends(input: vc.navBarTitle, preceding: "\n----------------------presented then reloaded cv ", following:  ""))

            setupTitleAndPresentViewController(vc: vc) { () -> () in
                previousOrientation = currentOrientation            // * should probably factor out
                reloadWithDelay(after: 0.02)
            }
        } else {
            previousOrientation = currentOrientation                // * should probably factor out
            reloadCV()              // should it have a time delay, as in the above completion block? (will test over time, with different devices)
            //reloadWithDelay(after: 0.02)
        }
        
        if collectionViewType == .days {
            removeMonthControlButtons()
            currentTopVC.setupMonthControlButtons()
        }
    }
    
    func setupTitleAndPresentViewController(vc: CollectionVC, completion: () -> ()) {               //print("\ndismissing/presenting") // vc: \(vc)
        setupAndPresent(vc: vc)
        completion()
    }
    
    
    func setupAndPresent(vc: CollectionVC) {
        setupViewTitle("", numLines: 1, alignment: .left)
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
