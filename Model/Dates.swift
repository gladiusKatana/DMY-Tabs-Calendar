//  Dates.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

func processCurrentDate() {
    (weekday, monthString, dayInt, year) = displayDate(currentDate)
    
    todayCellRow = dayInt / 7 + 1
    todayCellColumn = daysOfTheWeek.firstIndex(of: weekday)!
    
    thisMonthCellRow = months.firstIndex(of: monthString)! / 4
    thisMonthCellColumn = (months.firstIndex(of: monthString)! + 1) % 3    
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


func getMonthStringFrom(_ date: Date) -> String {                           // below methods basically return same as above but selectively
    let dateFormatter = DateFormatter();  dateFormatter.dateFormat = "MMMM"
    let nameOfMonth = dateFormatter.string(from: date)
    return nameOfMonth
}

func getDayFrom(_ date: Date) -> Int {
    let dateFormatter = DateFormatter();  dateFormatter.dateFormat = "d"
    let day = Int(dateFormatter.string(from: date))
    return day!
}
