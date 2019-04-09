//  CellText.swift
//  DMY-Tabs-Calendar
//  Created by Garth Snyder on 2019-02-07.  ⚔️//  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

extension CollectionVC {
    
    func setCellText (cell: CustomCell, indexPath: IndexPath) {

        let column = indexPath.item ; let row = indexPath.section // since loadsHorizontal should be true for a (typical) calendar

        cell.titleLabel.textColor = .white
        
        let dayLabels = ["S", "M", "T", "W", "T", "F", "S"]
        
        
        if row == calendarRowThatTodayIsOn && column == calendarColumnThatTodayIsOn {
            cell.backgroundColor = icyBlue
            cell.titleLabel.text = "\(dayInt)"
        }
        
        let daysAhead = 86400 * (column - calendarRowThatTodayIsOn + 7 * (row - calendarColumnThatTodayIsOn))
        let cellDate = Date() + TimeInterval(daysAhead)
        (_, _, dayInt, _) = displayDate(cellDate)

        
        if row == 0 {//< downcastLayout!.lockedHeaderSections { // probably won't want more than one locked header section (even more so for rows)
            cell.titleLabel.text = dayLabels[column]
        }
        else {
            cell.titleLabel.text = "\(dayInt)"
        }
    }
}


