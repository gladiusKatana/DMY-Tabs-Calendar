//  CellText.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

extension CollectionVC {
    
    func setCellText (cell: CustomCell, indexPath: IndexPath) {

        let column = indexPath.item ; let row = indexPath.section // since loadsHorizontal should be true for a (typical) calendar

        cell.titleLabel.textColor = .white
        
        let dayLabels = ["S", "M", "T", "W", "T", "F", "S"]
        
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        let convenientInitialStartDate = formatter.date(from: "2019/09/1 12:00")
        
        let secondsIntoTheFuture = 86400 * ((row - 1) * 7 + column)
        let cellDate = convenientInitialStartDate! + TimeInterval(secondsIntoTheFuture)

        let (_, _, _, _, dateInt, _, _, _, _) = displayDate(dateCreated: cellDate)
        
        

        //let customLayout = downcastLayout!
        if row == 0 {//< customLayout.lockedHeaderSections {
            cell.titleLabel.text = dayLabels[column]
        }
        else {
            cell.titleLabel.text = "\(dateInt)"
        }
    }
}


