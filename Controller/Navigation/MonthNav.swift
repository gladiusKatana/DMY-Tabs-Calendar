//  MonthNav.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    @objc func incrementMonth() {
//        var someDayNextMonth = Date()                                           //; print("\n\n----------day int: \(dayInt)")
//        if dayInt <= 15 {
//            someDayNextMonth = currentDate + TimeInterval(86400 * 35)
//        }
//        else {
//            someDayNextMonth = currentDate + TimeInterval(86400 * 16)
//        }                                                                       //; showDateForDebugging(someDayNextMonth)
        
        let currentMonthInt = months.firstIndex(of: monthString)! + 1
        var nextMonth = 0; var thisYearOrNext = year
        
        guard currentMonthInt != 12  else {
            nextMonth = 1; thisYearOrNext = year + 1
            return
        }
        
        nextMonth = currentMonthInt + 1                                           //; print("incrementing month  current int \(nextMonth)")
        
        let dayNextMonth = createDate(thisYearOrNext, monthInt: nextMonth, dayInt: 1)
        resetCurrentDateAndReload(dayNextMonth)
    }
    
    
    @objc func decrementMonth() {                                               //print("decrementing month")
//        var someDayLastMonth = Date()                                           //; print("\n\n----------day int: \(dayInt)")
//        if dayInt <= 15 {
//            someDayLastMonth = currentDate - TimeInterval(86400 * 16)
//        }
//        else {
//            someDayLastMonth = currentDate - TimeInterval(86400 * 35)
//        }                                                                       //; showDateForDebugging(someDayLastMonth)
        
        let currentMonthInt = months.firstIndex(of: monthString)! + 1
        var lastMonth = 0; var thisYearOrLast = year
        
        guard currentMonthInt != 1  else {
            lastMonth = 12; thisYearOrLast = year - 1
            return
        }
        
        lastMonth = currentMonthInt - 1                                           //; print("incrementing month  current int \(lastMonth)")
        
        let dayLastMonth = createDate(thisYearOrLast, monthInt: lastMonth, dayInt: 1)
        resetCurrentDateAndReload(dayLastMonth)
    }

    
    func resetCurrentDateAndReload(_ inputDate: Date) {
        if monthNameOf(inputDate) == monthNameOf(Date()) && yearOf(inputDate) == yearOf(Date()) {
            currentDate = Date()
        }
        else {
            //let daysSinceTheFirstOfTheMonth = dayIntOf(inputDate) - 1
            currentDate = inputDate //- TimeInterval(86400 * daysSinceTheFirstOfTheMonth)
        }
        
        processCurrentDate()
        setupViewTitle("\(monthString) \(year)\n", numLines: 1, alignment: .left)
        reloadCV()
    }
    
    /*func showDateForDebugging(_ inputDate: Date) {
        let (wkdy, moStr, dayI, yr) = displayDate(inputDate)   ; print("\nsome day next month: \(wkdy), \(moStr) \(dayI), \(yr)")
    }*/
}
