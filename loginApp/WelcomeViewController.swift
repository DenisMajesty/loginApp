//
//  WelcomeViewController.swift
//  loginApp
//
//  Created by Denis Shpagin on 17.05.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    
    var user = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user
    }
}
