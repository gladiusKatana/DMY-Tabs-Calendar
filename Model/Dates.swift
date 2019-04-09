//  Dates.swift
//  DMY-Tabs-Calendar
//  Created by Garth Snyder on 2019-02-07.  ⚔️//  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

//extension NSObject {

    func displayDate(_ inputDate: Date)
        -> (weekday: String, monthStr: String, dayInt: Int, year: Int)
    {                                                               //"h:mm" a 'on', dd, yyyy //"MMMM dd" //"MMM d"

        let weekdayFormatter = DateFormatter();                     weekdayFormatter.dateFormat = "EEEE"
        let monthStrFormatter = DateFormatter();                    monthStrFormatter.dateFormat = "MMMM"
        let dayIntFormatter = DateFormatter();                      dayIntFormatter.dateFormat = "d"
        let yearFormatter = DateFormatter();                        yearFormatter.dateFormat = "YYYY"

        let weekday = weekdayFormatter.string(from: inputDate as Date)//.capitalized
        let monthStr = monthStrFormatter.string(from: inputDate as Date)
        let dayInt = Int(dayIntFormatter.string(from: inputDate as Date))
        let year = Int(yearFormatter.string(from: inputDate as Date))
        
        return (weekday, monthStr, dayInt!, year!)
    }
//}
