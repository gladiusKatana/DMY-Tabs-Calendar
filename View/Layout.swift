//  Layout.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

class CCVFlowLayout : UICollectionViewFlowLayout {// stands for "Custom Collection View Flow Layout"
    
    var cellWidth: CGFloat?;                var cellHeight: CGFloat?
    var hSpace = CGFloat(0);                var vSpace = CGFloat(0);        var cellWd = CGFloat(0);                var cellHt = CGFloat(0)
    var xDefault = CGFloat(0);              var yDefault = CGFloat(0);      var widthPlusSpace = CGFloat(0);        var heightPlusSpace = CGFloat(0)
    var contentSize = CGSize.zero
    
    var cols = 0;                           var rows = 0;                   var lockedHeaderRows = 0;               var lockedHeaderSections = 0
    var majorElements = 0;                  var minorElements = 0
    
    var loadsHorizontal = false;            var cellDimensionsMode = CellDimensionsMode.neitherHardcoded
    var squareCells = false;                var squareCellMode = SquareCellMode.noAutoSquare
    
    init(rows: Int, cols: Int, lockedHeaderRows: Int, lockedHeaderSections: Int, cellWidth: CGFloat?, cellHeight: CGFloat?, hSpace: CGFloat, vSpace: CGFloat, loadsHorizontal: Bool, squareCellMode: SquareCellMode) {
        
        self.hSpace = hSpace;                       self.vSpace = vSpace
        self.rows = rows;                           self.cols = cols
        self.lockedHeaderRows = lockedHeaderRows;   self.lockedHeaderSections = lockedHeaderSections
        self.loadsHorizontal = loadsHorizontal;     self.squareCellMode = squareCellMode
        super.init()
        
        self.cellWidth = cellWidth;     self.cellHeight = cellHeight
        
        if cellWidth != nil && cellHeight != nil    {cellDimensionsMode = .widthAndHeightHardcoded}
            
        else if cellWidth == nil && cellHeight != nil {cellDimensionsMode = .heightHardcoded}
            
        else if cellWidth != nil && cellHeight == nil {cellDimensionsMode = .widthHardcoded}
            
        else if cellWidth == nil && cellHeight == nil {cellDimensionsMode = .neitherHardcoded}
            
        else {print("error with cell width and/or height initialization  cell width \(String(describing: cellWidth))  cell height \(String(describing: cellHeight))\n")} // this should never be executed
        
//        print(cellDimensionsMode.simpleDescription())
//        print(squareCellMode.simpleDescription())
        
        calculateSizes()
        self.cellWidth = cellWd;   self.cellHeight = cellHt
        //drawTestSquare()         //print("status  \(statusBarHeight) / \(lastStatusBarHeight)  launch width  \(launchWidth)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
