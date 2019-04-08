//  CellColours.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

extension CollectionVC {
    
    func setCellColours (cell: CustomCell, indexPath: IndexPath) {
        
        let row = indexPath.row; let column = indexPath.section
        
        let customLayout = downcastLayout!
        
        if row < customLayout.lockedHeaderRows || column < customLayout.lockedHeaderSections {
            cell.backgroundColor = headerColour
        }
        else {
            cell.backgroundColor = cellDefaultColour
        }
    }
}


