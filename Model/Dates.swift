//  Dates.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

func setCurrentDate() {
    (weekday, monthString, dayInt, year) = displayDate(currentDate)
    todayCalendarCellRow = dayInt / 7 + 1
    todayCalendarCellColumn = daysOfTheWeek.firstIndex(of: weekday)!
}


func displayDate(_ inputDate: Date)
    -> (weekday: String, monthStr: String, dayInt: Int, year: Int)
{
    let weekdayFormatter = DateFormatter();     weekdayFormatter.dateFormat = "EEEE"
    let monthStrFormatter = DateFormatter();    monthStrFormatter.dateFormat = "MMMM"
    let dayIntFormatter = DateFormatter();      dayIntFormatter.dateFormat = "d"
    let yearFormatter = DateFormatter();        yearFormatter.dateFormat = "YYYY"
    
    let weekday = weekdayFormatter.string(from: inputDate as Date)//.capitalized
    let monthStr = monthStrFormatter.string(from: inputDate as Date)
    let dayInt = Int(dayIntFormatter.string(from: inputDate as Date))
    let year = Int(yearFormatter.string(from: inputDate as Date))
    
    return (weekday, monthStr, dayInt!, year!)
}


func getDayFrom(date: Date) -> Int {
    let dateFormatter = DateFormatter();  dateFormatter.dateFormat = "d"
    let day = Int(dateFormatter.string(from: date))
    return day!
}
