//  MonthNavigationButtons.swift
//  DMY-Tabs-Calendar
//  Created by Garth Snyder on 2019-02-07.  ⚔️//  Copyright © 2019 Garth Snyder. All rights reserved.

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
        
        let daysBack = getDayFrom(date: someDayNextMonth) - 1                   //; print("days back: \(daysBack)")
        currentDate = someDayNextMonth - TimeInterval(86400 * daysBack)
        
//        (weekday, monthStr, dayInt, year) = displayDate(currentDate)            //; print("\n----------now it's \(weekday), \(monthStr) \(dayInt), \(year)")
//        todayCalendarCellRow = dayInt / 7 + 1
//        todayCalendarCellColumn = daysOfTheWeek.firstIndex(of: weekday)!
        
        setCurrentDate()                                                        //; print("\n----------now it's \(weekday), \(monthStr) \(dayInt), \(year)")
        
        setupViewTitle(titleText: "\(monthStr) \(year)\n", numLines: 1, alignment: .left)
        reloadCollectionView()
    }
    
    
    @objc func decrementMonth() {                                    //print("decrementing month")
        
    }
    
    
    func displayDateForDebugging(_ inputDate: Date) {
        let (wkdy, moStr, dayI, yr) = displayDate(inputDate)   ; print("\nsome day next month: \(wkdy), \(moStr) \(dayI), \(yr)")
    }
}
