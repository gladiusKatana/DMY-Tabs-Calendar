//  TestSquare.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit


func drawTestSquare() { //For testing purposes only: to verify calculation/recalculation of navbar height + status bar height, dynamically.
    testRectanglelayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: statusBarHeight + navBarHeight, width: 4, height: 4), cornerRadius: 0).cgPath
    
    let randy = randomNumber(inRange: 1...7) - 1
    testRectanglelayer.fillColor = randomColours[randy]
    globalKeyWindow.layer.addSublayer(testRectanglelayer) //vc.view.layer.addSub..
    //print("drawing rect clr[\(randy)] @ (\(statusBarHeight + navBarHeight)\n")
}


public func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
    let length = Int64(range.upperBound - range.lowerBound + 1)
    let value = Int64(arc4random()) % length + Int64(range.lowerBound)
    return T(value)
}

