//  Attributes.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit

extension CCVFlowLayout { 
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {return true}
    
    override func invalidateLayout() {                                                                          //print("invalidated layout")
        super.invalidateLayout()
    }
    
    override var collectionViewContentSize: CGSize {                                                            //print("content size = \(contentSize)")
        let w = CGFloat(majorElements) * widthPlusSpace
        let h = CGFloat(minorElements) * heightPlusSpace
        return CGSize(width: w, height: h)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {         //print("layout for elements...")
        var attributesForElements = [UICollectionViewLayoutAttributes]()
        
        for j in 0 ..< majorElements {
            for i in 0 ..< minorElements {
                
                var ip : IndexPath = IndexPath()
                
                if !loadsHorizontal {ip = IndexPath(item: i, section: j)}
                else                {ip = IndexPath(item: j, section: i)}
                
                let attribute = UICollectionViewLayoutAttributes(forCellWith: ip)///= self.layoutAttributesForItem(at: ip)! //*not implementing this method
                
                let xDefault : CGFloat = CGFloat(j) * widthPlusSpace
                let yDefault : CGFloat = CGFloat(i) * heightPlusSpace
                
                var xO = CGFloat(0);    var yO = CGFloat(0)                                                     //; print("*", terminator: "")
                
                if i < lockedTopHeaders && j < lockedLeftHeaders {
                    xO = xOffSet + CGFloat(j) * widthPlusSpace;     yO = yOffSet + CGFloat(i) * heightPlusSpace
                }
                else if i < lockedTopHeaders {
                    xO = xDefault;                                  yO = yOffSet + CGFloat(i) * heightPlusSpace
                }
                else if j < lockedLeftHeaders {
                    xO = xOffSet + CGFloat(j) * widthPlusSpace;     yO = yDefault
                }
                else {
                    xO = xDefault;                                  yO = yDefault
                }
                
                attribute.frame = CGRect(x: xO, y: yO, width: cellWidth!, height: cellHeight!)
                determineZIndex(item: j, section: i, cellAttributes: attribute)
                attributesForElements.append(attribute)
            }
        }
        return attributesForElements
    }
}
