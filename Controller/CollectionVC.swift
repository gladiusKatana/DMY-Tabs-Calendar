//  CollectionVC.swift
//  The 'Ultimate' Collection View Boilerplate
//  Created by Garth Snyder on 2019-02-07.  //  Copyright © 2019 Garth Snyder. All rights reserved. 

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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {return downcastLayout!.rows}
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {return downcastLayout!.rows}
    
    override func viewDidLoad() {
        collectionView.backgroundColor = navyBlue
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.reuseIdentifier)
        collectionView.bounces = false
        
        setupNotificationForStatusBarHeightChange()
        
        setTopViewController()
        print(substringWithAppends(input: navBarTitle, preceding: "\nview ", following:  " loaded"))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setTopViewController()
        
        if rePresentedVCFromButton {
            print(substringWithAppends(input: navBarTitle, preceding: "\nview ", following:  " appeared"))
        }

        setupViewTitle(titleText: navBarTitle, numLines: 1, alignment: .left)
        setupNavBarButtons(graySeven, atIndex: colourIndex)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.reuseIdentifier, for: indexPath) as! CustomCell
        
        cell.titleLabel.text = "\(indexPath.section),\(indexPath.row)"
        
        setCellColours(cell: cell, indexPath: indexPath)
        
//        print(indexPath)
        
        return cell
    }
}
