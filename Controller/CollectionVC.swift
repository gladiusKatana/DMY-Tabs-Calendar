//  CollectionVC.swift
//  DMY-Tabs-Calendar  ∙  1st commit Apr. 07, 2019  ∙  Created by Garth Snyder a.k.a. gladiusKatana ⚔️

import UIKit

class CollectionVC: UICollectionViewController {
    var navBarTitle: String = String("")
    var colourIndex: Int = Int()
    var downcastLayout : CCVFlowLayout?
    
    init(headerTitle: String, colourIndex: Int, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.navBarTitle = headerTitle
        self.colourIndex = colourIndex
        self.downcastLayout = layout as? CCVFlowLayout
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (downcastLayout!.loadsHorizontal) ? downcastLayout!.cols : downcastLayout!.rows
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (downcastLayout!.loadsHorizontal) ? downcastLayout!.rows : downcastLayout!.cols
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
        
        setupViewTitle(titleText: "\(monthStr) \(year)\n", numLines: 1, alignment: .left)
        setupNavBarButtons(graySeven, atIndex: colourIndex)
        setupMonthControlButtons()
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
