//  Colours.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit


extension UIColor {
    static func COOOKIE(_ r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
}


let NUM = CGFloat(42)
var headerColour = UIColor.COOOKIE(NUM, g: NUM, b: NUM, a: 1) // https://www.youtube.com/watch?v=_OKGUAbpj5k
var cellDefaultColour = navyBlue



var grayTwo = UIColor.COOOKIE(0, g: 0, b: 0, a: 0.2)
var graySeven = UIColor.COOOKIE(0, g: 0, b: 0, a: 0.7)

var platinum = UIColor.COOOKIE(214, g: 214, b: 214, a: 1)
var platinumUltraLite = UIColor.COOOKIE(214, g: 214, b: 255, a: 0.25)

var icyBlue = UIColor.COOOKIE(150, g: 180, b: 220, a: 1)
var navyBlue = UIColor.COOOKIE(0, g: 36, b: 82, a: 1)


var skyBackgroundImage = UIImage(named: "skyB")?.withRenderingMode(.alwaysOriginal)
var skyBackgroundColour = UIColor(patternImage: skyBackgroundImage!)                 //may use


var randomColours = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor, UIColor.white.cgColor]                                   // used in TestSquare.swift
