//  CellColours.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

extension CollectionVC {
    
    func setCellColours (cell: CustomCell, indexPath: IndexPath) {
        
        cell.titleLabel.textColor = .white //platinumMedium
        
        let row = indexPath.row; let column = indexPath.section
        
        let customLayout = downcastLayout!
        
        if row < customLayout.lockedTopHeaders || column < customLayout.lockedLeftHeaders {
            cell.backgroundColor = headerColour
        }
        else {
            
            if customLayout.squareCellMode == .noAutoSquare {
                if row % 2 != 0 {
                    cell.backgroundColor = grayTwo
                }
                else {
                    cell.backgroundColor = cellDefaultColour
                }
            }
            else {
                if row % 2 != 0 || column % 2 != 0 {
                    cell.backgroundColor = grayTwo
                }
                else {
                    cell.backgroundColor = cellDefaultColour
                }
            }
        }
    }
}


