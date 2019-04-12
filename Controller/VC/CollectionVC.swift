//  CollectionVC.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

class CollectionVC: UICollectionViewController {
    var downcastLayout : CCVFlowLayout?;    var collectionViewType = CollectionViewType.days
    var navBarTitle: String = String("");   var colourIndex: Int = Int()
    
    init(type collectionViewType: CollectionViewType, headerTitle: String, colourIndex: Int, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.collectionViewType = collectionViewType
        self.navBarTitle = headerTitle
        self.colourIndex = colourIndex
        self.downcastLayout = layout as? CCVFlowLayout
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.cols : downcastLayout!.rows
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (downcastLayout!.loadsHorizontally) ? downcastLayout!.rows : downcastLayout!.cols
    }
    
    override func viewDidLoad() {
        collectionView.backgroundColor = navyBlue
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        collectionView.bounces = false
        setupNotificationForStatusBarHeightChange()
        setTopViewController()
        print(substringWithAppends(input: navBarTitle, preceding: "\n💾view ", following:  " loaded"))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setTopViewController()
        if rePresentedVCFromButton {
            print(substringWithAppends(input: navBarTitle, preceding: "\n🏞view ", following:  " appeared"))
        }
        setupNavBarButtons(graySeven, atIndex: colourIndex)
        if collectionViewType == .days {
            setupViewTitle("\(monthString) \(year)", numLines: 1, alignment: .left)
            setupMonthControlButtons()
        }
        else {
            setupViewTitle("\(year)", numLines: 1, alignment: .left)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        cell.titleLabel.text = "\(indexPath.section),\(indexPath.item)"
        
        setCellColours(cell: cell, indexPath: indexPath)
        setCellText(cell: cell, indexPath: indexPath)
        //print(indexPath)
        return cell
    }
}
