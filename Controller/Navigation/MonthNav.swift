//  MonthNav.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    @objc func incrementMonth() {                                               //print("incrementing month")
        var someDayNextMonth = Date()                                           //; print("\n\n----------day int: \(dayInt)")
        if dayInt <= 15 {
            someDayNextMonth = currentDate + TimeInterval(86400 * 35)
        }
        else {
            someDayNextMonth = currentDate + TimeInterval(86400 * 16)
        }                                                                       //; showDateForDebugging(someDayNextMonth)
        resetCurrentDateAndReload(someDayNextMonth)
    }
    
    
    @objc func decrementMonth() {                                               //print("decrementing month")
        var someDayLastMonth = Date()                                           //; print("\n\n----------day int: \(dayInt)")
        if dayInt <= 15 {
            someDayLastMonth = currentDate - TimeInterval(86400 * 16)
        }
        else {
            someDayLastMonth = currentDate - TimeInterval(86400 * 35)
        }                                                                       //; showDateForDebugging(someDayLastMonth)
        resetCurrentDateAndReload(someDayLastMonth)
    }

    
    func resetCurrentDateAndReload(_ inputDate: Date) {
        if monthNameOf(inputDate) == monthNameOf(Date()) && yearOf(inputDate) == yearOf(Date()) {
            currentDate = Date()
        }
        else {
            let daysSinceTheFirstOfTheMonth = dayIntOf(inputDate) - 1
            currentDate = inputDate - TimeInterval(86400 * daysSinceTheFirstOfTheMonth)
        }
        
        processCurrentDate()
        setupViewTitle("\(monthString) \(year)\n", numLines: 1, alignment: .left)
        reloadCV()
    }
    
    /*func showDateForDebugging(_ inputDate: Date) {
        let (wkdy, moStr, dayI, yr) = displayDate(inputDate)   ; print("\nsome day next month: \(wkdy), \(moStr) \(dayI), \(yr)")
    }*/
}
