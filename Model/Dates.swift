//  Dates.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

extension NSObject {
    
    func displayDate(dateCreated: Date)
        -> (dy: String, tm: String, weekday: String, monAbbr: String, todayInt: Int, amPm: String, hrOnly: String, minOnly: String, secOnly: String)
    {                                                               //"h:mm" a 'on', dd, yyyy //"MMMM dd" //"MMM d"
        let dateFormatter = DateFormatter();                        dateFormatter.dateFormat = "MMM. dd"
        let nonRoundedTimeFormatter = DateFormatter();              nonRoundedTimeFormatter.dateFormat = "h:mm:ss"
        let timeToMinWithAmPm = DateFormatter();                    timeToMinWithAmPm.dateFormat = "h:mma"
        let hrFormatter = DateFormatter();                          hrFormatter.dateFormat = "h"
        let minFormatter = DateFormatter();                         minFormatter.dateFormat = "mma"
        let secFormatter = DateFormatter();                         secFormatter.dateFormat = "ss"
        let numberOnlyFormatter = DateFormatter();                  numberOnlyFormatter.dateFormat = "d"
        
        let todayInt = Int(numberOnlyFormatter.string(from: dateCreated as Date));  numberOnlyFormatter.dateFormat = "MMM"; /*reused on purpose*/
        let monAbbr = numberOnlyFormatter.string(from: dateCreated as Date) //abbr for abbreviated (month)
        
        let dy = dateFormatter.string(from: dateCreated as Date)
        let timeToMinuteWithAmPm = timeToMinWithAmPm.string(from: dateCreated as Date)
        let hrOnly = hrFormatter.string(from: dateCreated as Date)
        let minOnly = minFormatter.string(from: dateCreated as Date)
        let secOnly = secFormatter.string(from: dateCreated as Date)
        
        let weekday = dateCreated.dayOfWeek()!
        
        let tmNonRounded = nonRoundedTimeFormatter.string(from: dateCreated as Date)
        
        return (dy, tmNonRounded, weekday, monAbbr, todayInt!, timeToMinuteWithAmPm, hrOnly, minOnly, secOnly) //CRASHES IF YOUR DEVICE IS   NOT  ON 24HR TIME
    }
}

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE" //was "EEEE"
        return dateFormatter.string(from: self).capitalized //or  capitalized(with: locale)
    }
}
