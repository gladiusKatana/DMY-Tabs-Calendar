//  CellText.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    func setCellText (cell: CustomCell, indexPath: IndexPath) {
        let row = indexPath.section ; let column = indexPath.item // since loadsHorizontally should be true for a (typical) calendar vc...
        cell.titleLabel.textColor = platinum                      // ...(cells 'flow' in the prevailing horizontal direction)
        //
        if collectionViewType == .days {setupDailyCells(cell: cell, column: column, row: row)}
        if collectionViewType == .months {setupMonthlyCells(cell: cell, column: column, row: row)}
    }
    
    func setupDailyCells (cell: CustomCell, column: Int, row: Int) {
        let dayLabels = ["S", "M", "T", "W", "T", "F", "S"]
        
        if getMonthStringFrom(currentDate) == getMonthStringFrom(Date()) && getYearFrom(currentDate) == getYearFrom(Date())
            && row == todayCellRow && column == todayCellColumn {
            cell.backgroundColor = platinumLite
        }
        else {
            cell.backgroundColor = cellDefaultColour
        }
        
        let daysAhead = 86400 * (column - todayCellColumn + 7 * (row - todayCellRow))
        cell.cellDate = currentDate + TimeInterval(daysAhead)
        let (_, _, dayIntForDisplay, _) = displayDate(cell.cellDate)
        
        if row == 0 {//< downcastLayout!.lockedHeaderSections { // probably won't want more than one locked header section (even more so for rows)
            cell.titleLabel.text = dayLabels[column]
        }
        else {
            cell.titleLabel.text = "\(dayIntForDisplay)"
        }
        
        if getMonthStringFrom(cell.cellDate) == getMonthStringFrom(currentDate) { 
            cell.titleLabel.textColor = platinum
        }
        else {
            if row == 0 {cell.titleLabel.textColor = icyBlue}
            else {cell.titleLabel.textColor = platinumLite}
        }
    }
    
    func setupMonthlyCells (cell: CustomCell, column: Int, row: Int) {
        let monthIndex = row * 3 + column
        
        if thisMonthCellIndex == row * 3 + column {
            cell.cellDate = Date()
            cell.backgroundColor = platinumLite
        }
        else {
            cell.cellDate = createDate(year, monthInt: monthIndex + 1, dayInt: 1)
            cell.backgroundColor = cellDefaultColour
        }
        
        cell.titleLabel.text = months[monthIndex]  
    }
}


