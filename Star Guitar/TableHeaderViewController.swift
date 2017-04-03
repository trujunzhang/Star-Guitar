//
//  SettingsViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/19/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit
import SnapKit

class TableHeaderViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var divideView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        titleLabel.font = UIFont.tableTitleFont()

        self.titleLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(6)
            make.bottom.equalToSuperview().offset(-12)
        }
        self.divideView.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(2)
            make.bottom.equalToSuperview().offset(-10)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setTitle(title: String) {
        self.titleLabel.text = title
    }

    public static func addToContainer(_ container: UIView, withHeight height: CGFloat, withTitle title: String) {
        let tableHeaderViewController: TableHeaderViewController = StoryboardScene.Main.instantiateTableHeaderViewController()
        container.addSubview(tableHeaderViewController.view)
        tableHeaderViewController.view.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(height)
            make.top.equalToSuperview()
        }
        tableHeaderViewController.setTitle(title: title)
    }


}
