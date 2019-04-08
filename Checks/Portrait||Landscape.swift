//  Portrait||Landscape.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import Foundation


func checkOrientation() {
    
    let currentHeight = Double(globalKeyWindow.frame.height);   let currentWidth = Double(globalKeyWindow.frame.width)
    
    if currentHeight > currentWidth {
        currentOrientation = "portrait"
    }
    else if currentHeight < currentWidth {
        currentOrientation = "landscape"
    }
    else {print("\n\nApparently, somehow, the global key window's frame's height & width are being evaluated as equal...")} //shouldn't ever get called
}
