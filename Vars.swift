//  Vars.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

var globalKeyWindow = UIApplication.shared.keyWindow!

var navController: UINavigationController? = UINavigationController()

var cellGap = CGFloat(0)          // if nonzero, do NOT make this smaller than: 0.5 (iphone7), or else lines drawn inconsistently
//var testNum = 24                // only for testing, in the below vars


//--------------------------------------------------------------------------------------------
var daysLayout = CCVFlowLayout(rows: 7, cols: 6, lockedHeaderRows: 0, lockedHeaderSections: 1,
                                cellWidth: nil, cellHeight: nil, hSpace: cellGap, vSpace: cellGap,
                                loadsHorizontal: true,                      // note, if loadsHorizontal is true, 'rows' look like columns
                                squareCellMode: .autoSquareHeightFromWidth)

var monthsLayout = CCVFlowLayout(rows: 4, cols: 3, lockedHeaderRows: 0, lockedHeaderSections: 0,
                                cellWidth: nil, cellHeight: nil, hSpace: cellGap, vSpace: cellGap,
                                loadsHorizontal: false,
                                squareCellMode: .noAutoSquare)//* why no autocomplete for enum cases?

var daysVC = CollectionVC(headerTitle: "Collection View 1", colourIndex: 0, collectionViewLayout: daysLayout)
var monthsVC = CollectionVC(headerTitle: "Collection View 2", colourIndex: 1, collectionViewLayout: monthsLayout)
//--------------------------------------------------------------------------------------------


var currentTopVC : CollectionVC = CollectionVC(headerTitle: "temporary value to satisfy init", colourIndex: 0, collectionViewLayout: daysLayout)
var backgroundVC = UIViewController()

var statusBar = UIView();           var navbarTitleLabel = UILabel();       var testRectanglelayer = CAShapeLayer()

var currentOrientation = "orientation (landscape or portrait) for prepare-layout logic"
var previousOrientation = "previous orientation (landscape or portrait) for prepare-layout logic"
var launchOrientation = "orientation at the moment of launch"

var modelName = "device you're running on"
var phones = ["iPhone4", "iPhone 4s", "iPhone 5", "iPhone 5c", "iPhone 5s", "iPhone 6", "iPhone 6 Plus", "iPhone 6s", "iPhone 6s Plus", "iPhone 7", "iPhone 7 Plus", "iPhone SE", "iPhone 8", "iPhone 8 Plus", "iPhone X", "iPhone XS", "iPhone XS Max", "iPhone XR"]

var xOffSet = CGFloat(0);           var yOffSet = CGFloat(0)

var statusBarHeight = 0.0;          var lastStatusBarHeight = 0.0
var navBarHeight = 0.0;             var launchWidth = 0.0

var rePresentedVCFromButton = true; var willPresentVCAgainBecauseAppJustEnteredForeground = false



