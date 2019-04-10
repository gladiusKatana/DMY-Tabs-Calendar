//  ButtonSetup.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    func setupMonthControlButtons() {
        let buttonSize = 45;  var buttonYPosition = 450
        if Double(globalKeyWindow.frame.height) == 768 {
            buttonYPosition = 857//1024 - 167
        }
        
        monthButtonLeftImage = (UIImage(named: "worra")?.withRenderingMode(.alwaysTemplate))!
        monthButtonLeft = UIButton(frame: CGRect(x: 53,
                                                 y: buttonYPosition, width: buttonSize, height: buttonSize))
        
        monthButtonLeft.setImage(monthButtonLeftImage, for: UIControl.State())
        monthButtonLeft.tintColor = headerColour
        monthButtonLeft.addTarget(self, action: #selector(decrementMonth), for: UIControl.Event.touchUpInside)
        
        monthButtonRightImage = (UIImage(named: "arrow")?.withRenderingMode(.alwaysTemplate))!
        monthButtonRight = UIButton(frame: CGRect(x: Int(view.frame.width) - 53 - buttonSize,
                                                  y: buttonYPosition, width: buttonSize, height: buttonSize))
        
        monthButtonRight.setImage(monthButtonRightImage, for: UIControl.State())
        monthButtonRight.tintColor = headerColour
        monthButtonRight.addTarget(self, action: #selector(incrementMonth), for: UIControl.Event.touchUpInside)
        
        collectionView?.addSubview(monthButtonLeft)
        collectionView?.addSubview(monthButtonRight)
    }
    
}
