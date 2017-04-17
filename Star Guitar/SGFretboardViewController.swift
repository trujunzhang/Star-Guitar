//
//  SGFretboardViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

protocol FretboardProviderProtocol : class {    // 'class' means only class types can implement it
    func toggleCell(_ row: TuningsFretboardActionRow)
    func toggleHorizonCell(_ item: FretboardBorderGreenItem)
    func toggleVerticalCell(_ item: FretboardBorderGreenItem)
}

class SGFretboardViewController: QuickCollectionViewController {
    weak var delegate : FretboardProviderProtocol?
    
    let fretboardViewBoarderTypeHelper = FretboardViewBoarderTypeHelper()
    
    open override func configCollectionView(_ collectionView: UICollectionView, forLayout layout: UICollectionViewFlowLayout) {
        super.configCollectionView(collectionView, forLayout: layout)
        
        // Debug
        //collectionView.backgroundColor = .red
        
        layout.itemSize = CGSize(width: FretboardColumnSchema.itemWidth(), height: FretboardColumnSchema.itemHeight()) // cell的寬、高
        
        collectionView.allowsMultipleSelection = true
        
        collectionView.register(TuningsFretboardActionCell.self, forCellWithReuseIdentifier: String(describing: TuningsFretboardActionCell.self))
        collectionView.register(HorizonTuningsFretboardActionCell.self, forCellWithReuseIdentifier: String(describing: HorizonTuningsFretboardActionCell.self))
        collectionView.register(VerticalTuningsFretboardActionCell.self, forCellWithReuseIdentifier: String(describing: VerticalTuningsFretboardActionCell.self))
        collectionView.register(TuningsFretboardEmptyCell.self, forCellWithReuseIdentifier: String(describing: TuningsFretboardEmptyCell.self))
    }
    
    public func setHorizonSelectedCells(_ sectionIndex: Int){
        self.deselectAllCells()
        
        for index in 1...5 {
            self.collectionView?.selectItem(at: IndexPath(row: index,section:sectionIndex), animated: false, scrollPosition: .top)
        }
        
        let isLeft = fretboardViewBoarderTypeHelper.isLeft()
        if(isLeft){
            self.collectionView?.selectItem(at: IndexPath(row: 6,section:sectionIndex), animated: false, scrollPosition: .top)
        }else{
             self.collectionView?.selectItem(at: IndexPath(row: 0,section:sectionIndex), animated: false, scrollPosition: .top)
        }
    }
    
    public func setVerticalSelectedCells(_ rowIndex: Int){
        self.deselectAllCells()
        
        for section in 1...13 {
            self.collectionView?.selectItem(at: IndexPath(row: rowIndex,section:section), animated: false, scrollPosition: .top)
        }
        
        let isTop = fretboardViewBoarderTypeHelper.isTop()
        if(isTop){
            self.collectionView?.selectItem(at: IndexPath(row: rowIndex,section:14), animated: false, scrollPosition: .top)
        }else{
            self.collectionView?.selectItem(at: IndexPath(row: rowIndex,section:0), animated: false, scrollPosition: .top)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let type = GuitarConfigureAsync.sharedInstance.getCurrentFretboardBorderType()
        fretboardViewBoarderTypeHelper.convertBoarderType(type)
        
        tableContents = self.generateFretboardSections()
    }        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
