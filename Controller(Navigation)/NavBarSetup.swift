//  NavBarSetup.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

extension CollectionVC {  
    
    func setupViewTitle(titleText: String, numLines: Int, alignment: NSTextAlignment) {
        navbarTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 1366, height: 20)) //1366 is the width (# of points wide) of the ipad pro 12.9"
        navbarTitleLabel.backgroundColor = .clear
        navbarTitleLabel.text = titleText; navbarTitleLabel.numberOfLines = numLines
        navbarTitleLabel.textAlignment = alignment
        navbarTitleLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        navbarTitleLabel.textColor = .black
        navbarTitleLabel.isUserInteractionEnabled = false
        navigationItem.titleView = navbarTitleLabel
    }
    
    func setupNavBarButtons(_ withCustomColour: UIColor?, atIndex: Int?) {
        let navSelectorForVCOne = #selector(buttonWrapperMethodforVCOne)
        let navSelectorForVCTwo = #selector(ButtonWrapperMethodforVCTwo)
        let navSelectorForReloading = #selector(reloadCollectionView)
        let buttonOne = setupButton(selector: navSelectorForVCOne, title: "timetableImage")
        let buttonTwo = setupButton(selector: navSelectorForVCTwo, title: "calendarImage")
        let reloadButton = setupButton(selector: navSelectorForReloading, title: "reloadButton")
        navigationItem.rightBarButtonItems = [buttonTwo, buttonOne, reloadButton]
        
        var barButtonColours = [grayTwo, grayTwo, .clear]
        
        for button in navigationItem.rightBarButtonItems! {
            if let index = navigationItem.rightBarButtonItems?.firstIndex(of: button) {
                button.tintColor = barButtonColours[index]
            }
        }
        if let customColour = withCustomColour {
            if let colourIndex = atIndex {
                navigationItem.rightBarButtonItems?[colourIndex].tintColor = customColour
            } else {print("<no custom colour index>")}
        } //else {print("<no custom colour>")}
    }
    
    func setupButton(selector: Selector, title: String) -> UIBarButtonItem {
        let image = UIImage(named: title)?.withRenderingMode(.alwaysTemplate)
        let button = UIBarButtonItem(image: image, landscapeImagePhone: image, style: .plain, target: self, action: selector)
        return button
    }
    
    @objc func buttonWrapperMethodforVCOne() {presentViaVCButton(vc: viewControllerOne)}
    @objc func ButtonWrapperMethodforVCTwo() {presentViaVCButton(vc: viewControllerTwo)}
    
    func presentViaVCButton(vc: CollectionVC) {
        rePresentedVCFromButton = true
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.gotoView(vc: vc)
        }
    }
}



