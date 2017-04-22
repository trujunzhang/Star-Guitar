//
//  QuickcollectionViewController.swift
//  QuickcollectionViewController
//
//  Created by Ben on 25/08/2015.
//  Copyright (c) 2015 bcylin.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit

/// A table view controller that shows `tableContents` as formatted sections and rows.

open class QuickCollectionViewController: UIViewController{

    /// A Boolean value indicating if the controller clears the selection when the collection view appears.
    public var clearsSelectionOnViewWillAppear = true

    /// Returns the table view managed by the controller object.
    /// To override the cell type to display certain rows, register a different type with `row.cellReuseIdentifier`.
    public private(set) var collectionView: UICollectionView?

    /// The layout of sections and rows to display in the table view.
    public var tableContents: [Section] = [Section]()
    
    public func deselectAllCells(){
        for indexPath in self.collectionView?.indexPathsForSelectedItems ?? [] {
            self.collectionView?.deselectItem(at: indexPath, animated: false)
        }
    }
    
    public func setDefaultSelectedCells(_ collectionView: UICollectionView){
        // Setup the default selected cells for children class
        //fatalError("Subclasses need to implement the `setDefaultSelectedCells()` method.")
    }

    deinit {
        collectionView?.dataSource = nil
        collectionView?.delegate = nil
    }

    open func configCollectionView(_ collectionView: UICollectionView, forLayout layout: UICollectionViewFlowLayout) {
        collectionView.backgroundColor = .clear

        layout.sectionInset =  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // section與section之間的距離
        layout.itemSize = CGSize(width: 80, height: 120) // cell的寬、高
        layout.minimumLineSpacing = CGFloat(integerLiteral: 0) // collectionView設定為縱向的話即「行」的間距、橫向則為「列」的間距
        layout.minimumInteritemSpacing = CGFloat(integerLiteral: 0) // collectionView設定為縱向的話即「列」的間距、橫向則為「行」的間距
        layout.scrollDirection = UICollectionViewScrollDirection.vertical // 滑動方向，預設為垂直。注意若設為垂直，則cell的加入方式為由左至右，滿了才會換行；若是水平則由上往下，滿了才會換列
        
        collectionView.allowsMultipleSelection = false

    }

    // MARK: - UIViewController

    open override func loadView() {
        super.loadView()

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        view.addSubview(collectionView)

        collectionView.frame = view.bounds

        collectionView.isScrollEnabled = false

        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.dataSource = self
        collectionView.delegate = self

        self.configCollectionView(collectionView, forLayout: layout)
        
        self.collectionView = collectionView
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
               
        self.setDefaultSelectedCells(collectionView!)
    }
    
    public func getSelectedItems() ->[IndexPath]?{
        return self.collectionView?.indexPathsForSelectedItems
    }
    
}



// MARK: - UICollectionViewDataSource
extension QuickCollectionViewController: UICollectionViewDataSource{
    
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return tableContents.count
    }
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableContents[section].rows.count
    }
    
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = tableContents[indexPath.section].rows[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: row.cellReuseIdentifier, for: indexPath)
        
        let isSelect = cell.isSelected
        
        //print("")
        //print("collection's select: \(isSelect)")
        //print("")
        
        
        row.render(viewCell: cell)
        
        return cell 
    }
}

// MARK: - UICollectionViewDelegate
extension QuickCollectionViewController: UICollectionViewDelegate{
    
    // Methods for notification of selection/deselection and highlight/unhighlight events.
    // The sequence of calls leading to selection from a user touch is:
    //
    // (when the touch begins)
    // 1. -collectionView:shouldHighlightItemAtIndexPath:
    // 2. -collectionView:didHighlightItemAtIndexPath:
    //
    // (when the touch lifts)
    // 3. -collectionView:shouldSelectItemAtIndexPath: or -collectionView:shouldDeselectItemAtIndexPath:
    // 4. -collectionView:didSelectItemAtIndexPath: or -collectionView:didDeselectItemAtIndexPath:
    // 5. -collectionView:didUnhighlightItemAtIndexPath:

    
    // 1. -collectionView:shouldHighlightItemAtIndexPath:
    public func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        let row = tableContents[indexPath.section].rows[indexPath.row]
        
        if (row.action) != nil{
            return row.shouldHighlightRowAt()
        }
        
        return false
    }
    
    // 2. -collectionView:didHighlightItemAtIndexPath:
    public func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell:UICollectionViewCell = collectionView.cellForItem(at: indexPath){
            let row = tableContents[indexPath.section].rows[indexPath.row]
            
            row.setHighlightRowAt(cell, didHighlight: true)
        }
    }
    
    // 3. -collectionView:shouldSelectItemAtIndexPath: or -collectionView:shouldDeselectItemAtIndexPath:
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let row = tableContents[indexPath.section].rows[indexPath.row]
        
        if (row.action) != nil{
            return row.shouldHighlightRowAt()
        }
        
        return false
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 4. -collectionView:didSelectItemAtIndexPath: or -collectionView:didDeselectItemAtIndexPath:
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let row = tableContents[indexPath.section].rows[indexPath.row]
        
        if let cell:UICollectionViewCell = collectionView.cellForItem(at: indexPath){
            row.setSelectedRowAt(cell, didSelect: true)
        }
        
        
        if let action = row.action{
            action(row)
        }
        //else{
        //collectionView.deselectItem(at: indexPath, animated: true)
        //}
    }
    
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if let cell:UICollectionViewCell = collectionView.cellForItem(at: indexPath){
            let row = tableContents[indexPath.section].rows[indexPath.row]
            
            row.setSelectedRowAt(cell, didSelect: false)
        }
    }
    
    // 5. -collectionView:didUnhighlightItemAtIndexPath:
    public func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell:UICollectionViewCell = collectionView.cellForItem(at: indexPath){
            let row = tableContents[indexPath.section].rows[indexPath.row]
            
            row.setHighlightRowAt(cell, didHighlight: false)
        }
    }
}

////////////////////////////////////////////////////////////////////////////////
private extension UIView {

    var containerCell: UICollectionViewCell? {
        return (superview as? UICollectionViewCell) ?? superview?.containerCell
    }

}


