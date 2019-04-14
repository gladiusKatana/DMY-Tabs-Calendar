//  Selecting.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

extension CollectionVC {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        
        switch collectionViewType {
            
        case .days:
            print(formalDateString(cell.cellDate, comment: "selected day-cell date:"))
            
        case .months:
            print(formalDateString(cell.cellDate, comment: "selected month-cell date:"))
            
//            let nameOfSelectedMonth = getMonthStringFrom(cell.cellDate)
//            let index = months.firstIndex(of: nameOfSelectedMonth)!
//            let thisMonthCellRow = index / 4
//            print("month-cell date month string is \(nameOfSelectedMonth), index \(index), days-row \(thisMonthCellRow)")
            
            currentDate = cell.cellDate
            processCurrentDate()
            presentViaVCButton(vc: daysVC)
            
        default:
            print(formalDateString(cell.cellDate, comment: "selected cell date:"))
        }
    }
    
}