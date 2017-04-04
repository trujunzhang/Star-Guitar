//
//  SettingsViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/19/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit


struct TitleViewSchema {
    public static func getCurrentTitleHeight() -> Int{
        return 80 +  SGScreenLayout.sharedInstance.deviceIndex * 10
    }
}

protocol TitleViewBackButtonProviderProtocol : class {    // 'class' means only class types can implement it
    func onBackButtonClick()
}

class TitleViewController: UIViewController {
    weak var delegate : TitleViewBackButtonProviderProtocol?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!


    @IBAction func backArrowTaped(_ sender: Any) {
        if let _delegate = self.delegate{
            _delegate.onBackButtonClick()
        }
        self.dismiss(animated: true, completion: nil)        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        titleLabel.font = UIFont.pageTitleFont()
        subtitleLabel.font = UIFont.pageSubtitleFont()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setTitle(title: String) {
        self.titleLabel.text = title
    }

    func setTitleWithSubtitle(title: String, subtitle: String) {
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
    }
    
    func setTitle(title: String,delegate:TitleViewBackButtonProviderProtocol) {
        self.titleLabel.text = title
        self.delegate = delegate
    }
    
    func setTitleWithSubtitle(title: String, subtitle: String,delegate:TitleViewBackButtonProviderProtocol) {
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        self.delegate = delegate
    }


}
