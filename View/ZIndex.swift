//  ZIndex.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

extension CCVFlowLayout {
    
    func determineZIndex(item: Int, section: Int, cellAttributes: UICollectionViewLayoutAttributes) {    // Determine zIndex based on cell type.
        //var zIndexPrintable: Int = Int()
        
        if section < lockedHeaderSections && item < lockedHeaderRows {  //Determine zIndex based on cell type.
            cellAttributes.zIndex = 4
        }
        else if item < lockedHeaderRows {
            cellAttributes.zIndex = 3
        }
        else if section < lockedHeaderSections {
            cellAttributes.zIndex = 2
        }
        else {
            cellAttributes.zIndex = 1
        }
    }
}
