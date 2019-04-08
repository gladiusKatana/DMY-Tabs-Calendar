//  Colours.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved.

import UIKit


extension UIColor {
    static func COOOKIE(_ r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}


let NUM = CGFloat(42)
var headerColour = UIColor.COOOKIE(NUM, g: NUM, b: NUM, a: 1) // https://www.youtube.com/watch?v=_OKGUAbpj5k
var cellDefaultColour = navyBlue


var randomColours = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor, UIColor.white.cgColor]


var grayPointZeroFive = UIColor.COOOKIE(0, g: 0, b: 0, a: 0.03)
var grayOne = UIColor.COOOKIE(0, g: 0, b: 0, a: 0.1)
var grayTwo = UIColor.COOOKIE(0, g: 0, b: 0, a: 0.2)
var graySeven = UIColor.COOOKIE(0, g: 0, b: 0, a: 0.7)


var platinum = UIColor.COOOKIE(214, g: 214, b: 214, a: 1)
var platinumMedium = UIColor.COOOKIE(214, g: 214, b: 255, a: 0.8)
var platinumUltraLite = UIColor.COOOKIE(214, g: 214, b: 255, a: 0.45)
var platinumBarelyThere = UIColor.COOOKIE(214, g: 214, b: 255, a: 0.1)


var icyBlue = UIColor.COOOKIE(150, g: 180, b: 220, a: 1)
var darkerIcyBlue = UIColor.COOOKIE(100, g: 140, b: 200, a: 1)
var navyBlue = UIColor.COOOKIE(0, g: 36, b: 82, a: 1)
//(30, green: 40, blue: 160, alpha: 1) looked ok too


var skyBackgroundImage = UIImage(named: "skyB")?.withRenderingMode(.alwaysOriginal)
var skyBackgroundImageColour = UIColor(patternImage: skyBackgroundImage!)

