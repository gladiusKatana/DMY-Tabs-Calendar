//  CellText.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    func setCellText (cell: CustomCell, indexPath: IndexPath) {
        
        let column = indexPath.item ; let row = indexPath.section // since loadsHorizontal should be true for a (typical) calendar
        
        cell.titleLabel.textColor = .white
        
        let dayLabels = ["S", "M", "T", "W", "T", "F", "S"]
        
        if row == todayCalendarCellRow && column == todayCalendarCellColumn {
            cell.backgroundColor = icyBlue
            cell.titleLabel.text = "\(dayInt)"
        }
        
        let daysAhead = 86400 * (column - todayCalendarCellColumn + 7 * (row - todayCalendarCellRow))
        let cellDate = currentDate + TimeInterval(daysAhead)
        let (_, _, dayIntForDisplay, _) = displayDate(cellDate)

        if row == 0 {//< downcastLayout!.lockedHeaderSections { // probably won't want more than one locked header section (even more so for rows)
            cell.titleLabel.text = dayLabels[column]
        }
        else {
            cell.titleLabel.text = "\(dayIntForDisplay)"
        }
    }
}


