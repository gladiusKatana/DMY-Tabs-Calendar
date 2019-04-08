//  Prepare.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

extension CCVFlowLayout {
    
    override func prepare() {
        calculateSizes()
        cellWidth = cellWd;                     cellHeight = cellHt
        widthPlusSpace = cellWidth! + hSpace;   heightPlusSpace = cellHeight! + vSpace
        
        var statusBarDelta = 0.0
        if UIApplication.shared.statusBarFrame.size.height > 20 {                           //print("Δ")
            statusBarDelta = Double(UIApplication.shared.statusBarFrame.size.height - 20)
        }
        
        yOffSet = collectionView!.contentOffset.y + CGFloat(navBarHeight + statusBarHeight - statusBarDelta) //print("yo: \(yOffSet)")
        xOffSet = collectionView!.contentOffset.x
        
        checkOrientation()                                              //print(substringWithAppends(input: currentTopVC.navBarTitle, preceding: "---------------------prepare cv  ", following:  "  cell width: \(cellWidth!)  nav bar height: \(navBarHeight)"))
        
        if previousOrientation != currentOrientation  {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                currentTopVC.reloadAfterPreparingVCAndPossiblyPresentingItAgain(vc: currentTopVC)
            }
        } //else {print("will not call "reload-after-preparing-vc-and-possibly-presenting-it-again"")}
    }
    
    func calculateSizes() {                                                                 //print("resizing cells")
        statusBarHeight = Double(UIApplication.shared.statusBarFrame.size.height)           //; print("status bar: \(statusBarHeight)")
        navBarHeight = Double((navController?.navigationBar.frame.height)!)                 //; print("nav bar: \(navBarHeight)")
        
        if !loadsHorizontal {majorElements = cols; minorElements = rows                     //; print("should load vertically")
        }
        else {               majorElements = rows; minorElements = cols                     //; print("cells should load horizontally")
        }
        
        let autofitWidth = CGFloat(Double(globalKeyWindow.frame.width) - 0.5) / CGFloat(majorElements) - hSpace
        let autoFitHeight = CGFloat(Double(globalKeyWindow.frame.height) - navBarHeight - statusBarHeight) / CGFloat(minorElements) - vSpace

        switch cellDimensionsMode {
        
        case .widthAndHeightHardcoded:
            cellWd = cellWidth!;            cellHt = cellHeight!
            
        case .heightHardcoded:
            cellWd = autofitWidth;          cellHt = cellHeight!
            
        case .widthHardcoded:
            cellWd = cellWidth!;            cellHt = autoFitHeight
            
        case .neitherHardcoded:
            cellWd = autofitWidth;          cellHt = autoFitHeight
        }
        
        resetDimensionIfSquareCellsOn()
    }
}



