//  ButtonSetup.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    func setupMonthControlButtons() {
        
        let buttonSize = 50
        let buttonY = CGFloat(7) * downcastLayout!.cellHeight! + CGFloat(50)
        
//        if Double(globalKeyWindow.frame.height) == 768 {
//            buttonY = 857 // = 1024 - 167
//        }
        
        monthButtonLeftImage = (UIImage(named: "worra")?.withRenderingMode(.alwaysTemplate))!
        monthButtonLeft = UIButton(frame: CGRect(x: 53,
                                                 y: Int(buttonY), width: buttonSize, height: buttonSize))
        
        monthButtonLeft.setImage(monthButtonLeftImage, for: UIControl.State())
        monthButtonLeft.tintColor = halfIcyBlue
        monthButtonLeft.addTarget(self, action: #selector(decrementMonth), for: UIControl.Event.touchUpInside)
        
        monthButtonRightImage = (UIImage(named: "arrow")?.withRenderingMode(.alwaysTemplate))!
        monthButtonRight = UIButton(frame: CGRect(x: Int(globalKeyWindow.frame.width) - 53 - buttonSize,
                                                  y: Int(buttonY), width: buttonSize, height: buttonSize))
        
        monthButtonRight.setImage(monthButtonRightImage, for: UIControl.State())
        monthButtonRight.tintColor = halfIcyBlue
        monthButtonRight.addTarget(self, action: #selector(incrementMonth), for: UIControl.Event.touchUpInside)
        
        collectionView?.addSubview(monthButtonLeft)
        collectionView?.addSubview(monthButtonRight)
    }
    
    func removeMonthControlButtons() {
        monthButtonLeft.removeFromSuperview()
        monthButtonRight.removeFromSuperview()
    }
}
