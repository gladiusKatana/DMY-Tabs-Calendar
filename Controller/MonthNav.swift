//  MonthNavigationButtons.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    func setupMonthControlButtons() {
        let buttonSize = 45;  var buttonYPosition = 450
        if Double(globalKeyWindow.frame.height) == 768 {
            buttonYPosition = 857//1024 - 167
        }
        
        monthButtonLeftImage = (UIImage(named: "worra")?.withRenderingMode(.alwaysTemplate))!
        monthButtonLeft = UIButton(frame: CGRect(x: 53, y: buttonYPosition, width: buttonSize, height: buttonSize))
        monthButtonLeft.setImage(monthButtonLeftImage, for: UIControl.State())
        monthButtonLeft.tintColor = headerColour
        monthButtonLeft.addTarget(self, action: #selector(decrementMonth), for: UIControl.Event.touchUpInside)
        
        monthButtonRightImage = (UIImage(named: "arrow")?.withRenderingMode(.alwaysTemplate))!
        monthButtonRight = UIButton(frame: CGRect(x: Int(view.frame.width) - 53 - buttonSize, y: buttonYPosition, width: buttonSize, height: buttonSize))
        monthButtonRight.setImage(monthButtonRightImage, for: UIControl.State())
        monthButtonRight.tintColor = headerColour
        monthButtonRight.addTarget(self, action: #selector(incrementMonth), for: UIControl.Event.touchUpInside)
        
        collectionView?.addSubview(monthButtonLeft)
        collectionView?.addSubview(monthButtonRight)
    }
    
    @objc func incrementMonth() {                                               //print("incrementing month")
        var someDayNextMonth = Date()                                           //; print("\n\n----------day int: \(dayInt)")
        if dayInt <= 15 {
            someDayNextMonth = currentDate + TimeInterval(86400 * 35)
        }
        else {
            someDayNextMonth = currentDate + TimeInterval(86400 * 16)
        }                                                                       //; displayDateForDebugging(someDayNextMonth)

        resetCurrentDateAndReload(someDayNextMonth)
    }
    
    @objc func decrementMonth() {                                               //print("decrementing month")
        var someDayLastMonth = Date()                                           //; print("\n\n----------day int: \(dayInt)")
        if dayInt <= 15 {
            someDayLastMonth = currentDate - TimeInterval(86400 * 16)
        }
        else {
            someDayLastMonth = currentDate - TimeInterval(86400 * 35)
        }                                                                       //; displayDateForDebugging(someDayNextMonth)
        
        resetCurrentDateAndReload(someDayLastMonth)
    }

    func resetCurrentDateAndReload(_ inputDate: Date) {
        let daysSinceTheFirstOfTheMonth = getDayFrom(date: inputDate) - 1 //; print("days back: \(daysSinceTheFirstOfTheMonth)")
        currentDate = inputDate - TimeInterval(86400 * daysSinceTheFirstOfTheMonth)
        
        setCurrentDate()                                                        //; print("\n----------now it's \(weekday), \(monthStr) \(dayInt), \(year)")
        
        setupViewTitle(titleText: "\(monthStr) \(year)\n", numLines: 1, alignment: .left)
        reloadCollectionView()
    }
    
    func displayDateForDebugging(_ inputDate: Date) {
        let (wkdy, moStr, dayI, yr) = displayDate(inputDate)   ; print("\nsome day next month: \(wkdy), \(moStr) \(dayI), \(yr)")
    }
}