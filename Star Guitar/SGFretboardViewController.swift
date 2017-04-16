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
}

class SGFretboardViewController: QuickCollectionViewController {
    weak var delegate : FretboardProviderProtocol?
    
    let fretboardViewBoarderTypeHelper = FretboardViewBoarderTypeHelper()
    
    open override func configCollectionView(_ collectionView: UICollectionView, forLayout layout: UICollectionViewFlowLayout) {
        super.configCollectionView(collectionView, forLayout: layout)
        
        // Debug
        //collectionView.backgroundColor = .red
        
        layout.itemSize = CGSize(width: FretboardColumnSchema.itemWidth(), height: FretboardColumnSchema.itemHeight()) // cell的寬、高
        
        collectionView.register(TuningsFretboardActionCell.self, forCellWithReuseIdentifier: String(describing: TuningsFretboardActionCell.self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let type = GuitarSettingsUtils.sharedInstance.getCurrentFretboardBorderType()
        fretboardViewBoarderTypeHelper.convertBoarderType(type)
        

        tableContents = self.generateFretboardSections()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
}
