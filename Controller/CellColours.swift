//  CellColours.swift
//  DMY-Tabs-Calendar
//  Created by Garth Snyder on 2019-02-07.  ⚔️//  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

extension CollectionVC {
    
    func setCellColours (cell: CustomCell, indexPath: IndexPath) {
        
        let row = indexPath.item; let column = indexPath.section
        
        let customLayout = downcastLayout!
        
        if row < customLayout.lockedHeaderRows || column < customLayout.lockedHeaderSections {
            cell.backgroundColor = headerColour
        }
        else {
            cell.backgroundColor = cellDefaultColour
        }
    }
}


