//  Load&Appear.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    override func viewDidLoad() {
        
        collectionView.backgroundColor = navyBlue
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        collectionView.bounces = false
        setupNotificationForStatusBarHeightChange()
        setTopViewController()
        print(substringWithAppends(input: navBarTitle, preceding: "\n💾view ", following:  " loaded"))
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if collectionViewType == .days {
            setupViewTitle("\(monthString) \(year)", numLines: 1, alignment: .left)
        }
        else if collectionViewType == .months {
            currentDate = Date()
            processCurrentDate()
            setupViewTitle("\(year)", numLines: 1, alignment: .left)
        }

        else {
//        print("yearly view controller appeared, it may not be set up yet/") // * will set up soon
        }
        
        if rePresentedVCFromButton {
            rePresentedVCFromButton = false
            reloadCV()                       
            print(substringWithAppends(input: navBarTitle, preceding: "\n🏞view ", following:  " appeared"))
        } //above method called early (before actually appears) to print on first appearance + avoid an additional reset of rePresentedVCFromButton
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        setTopViewController()
        setupNavBarButtons(grayTwo, atIndex: colourIndex)
        
        if collectionViewType == .days {
            removeMonthControlButtons()
            setupMonthControlButtons()
        }
    }
}
