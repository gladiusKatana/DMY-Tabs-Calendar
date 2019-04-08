//  CellText.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

extension CollectionVC {
    
    func setCellText (cell: CustomCell, indexPath: IndexPath) {

        let column = indexPath.row ; let row = indexPath.section
        
//        let customLayout = downcastLayout!
        
        cell.titleLabel.textColor = .white //platinumMedium
        
        let days = ["S", "M", "T", "W", "T", "F", "S"]
        
        if row == 0 {//< customLayout.lockedHeaderSections {
            cell.titleLabel.text = days[column]
        }
//        else {
//            cell.titleLabel.text = "\(column)"
//        }
    }
}


