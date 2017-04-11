//
//  QuickTableViewController.swift
//  QuickTableViewController
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
import SnapKit

/// A table view controller that shows `tableContents` as formatted sections and rows.

open class QuickTableViewController: UIViewController,
        UITableViewDataSource,
        UITableViewDelegate {

    /// A Boolean value indicating if the controller clears the selection when the collection view appears.
    public var clearsSelectionOnViewWillAppear = true

    /// Returns the table view managed by the controller object.
    /// To override the cell type to display certain rows, register a different type with `row.cellReuseIdentifier`.
    public private(set) var tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)

    /// The layout of sections and rows to display in the table view.
    public var tableContents: [Section] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Initialization

    /**
     Initializes a table view controller to manage a table view of a given style.
     
     - parameter style: A constant that specifies the style of table view that the controller object is to manage (UITableViewStylePlain or UITableViewStyleGrouped).
     
     - returns: An initialized `QuickTableViewController` object.
     */
    public convenience init(style: UITableViewStyle) {
        self.init(nibName: nil, bundle: nil)
        tableView = UITableView(frame: CGRect.zero, style: style)
    }

    deinit {
        tableView.dataSource = nil
        tableView.delegate = nil
    }

    open func configTableView(_ tableView: UITableView) {
        tableView.backgroundColor = .clear
    }

    // MARK: - UIViewController

    open override func loadView() {
        super.loadView()
        view.addSubview(tableView)
        tableView.frame = view.bounds

        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none

        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.dataSource = self
        tableView.delegate = self

        self.configTableView(tableView)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.clearAllSelection()
    }
    
    public func clearAllSelection(){
        if let indexPath = tableView.indexPathForSelectedRow, clearsSelectionOnViewWillAppear {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    // MARK: - UITableViewDataSource

    open func numberOfSections(in tableView: UITableView) -> Int {
        return tableContents.count
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContents[section].rows.count
    }

    //open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //    return "wh"//tableContents[section].title
    //}

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let title = tableContents[section].title {
            let frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: SGSettingsScreen.settingsSectionHeaderHeight())
            let headerView = UIView(frame: frame)

            TableHeaderViewController.addToContainer(headerView, withHeight: SGSettingsScreen.settingsSectionHeaderHeight(), withTitle: title)

            return headerView
        }
        return nil
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableContents[section].title != nil {
            return SGSettingsScreen.settingsSectionHeaderHeight()
        }
        return UITableViewAutomaticDimension
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let height = self.getTableViewHeightForFooterInSection(section: section)
        if height != UITableViewAutomaticDimension{
            let frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: height)
            let footerView = UIView(frame: frame)
            footerView.backgroundColor = .clear
            return footerView
        }
        return nil
    }

    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.getTableViewHeightForFooterInSection(section: section)
    }
    
    public func getTableViewHeightForFooterInSection(section: Int)  -> CGFloat  {
        return UITableViewAutomaticDimension
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = tableContents[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.cellReuseIdentifier)

        row.render(viewCell: cell!)


        if let icon = (row as? IconEnabled)?.icon {
            if let image = icon.image {
                cell?.imageView?.image = image
            }
            if let image = icon.highlightedImage {
                cell?.imageView?.highlightedImage = image
            }
        }

        cell?.textLabel?.text = row.title
        return cell ?? tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = tableContents[indexPath.section].rows[indexPath.row]

        return row.getRowHeight(indexPath: indexPath)
    }

    // MARK: - UITableViewDelegate

    open func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let row = tableContents[indexPath.section].rows[indexPath.row]

        if (row.action) != nil{
            return row.shouldHighlightRowAt()
        }
        
        return false
    }

    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = tableContents[indexPath.section].rows[indexPath.row]
        
        if let action = row.action{
            action(row)
        }else{
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}


////////////////////////////////////////////////////////////////////////////////


private extension UIView {

    var containerCell: UITableViewCell? {
        return (superview as? UITableViewCell) ?? superview?.containerCell
    }

}


