//
//  ViewController.swift
//  loginApp
//
//  Created by Denis Shpagin on 16.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordtextFeild: UITextField!
    
    private let login = "Denis"
    private let password = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController = segue.destination as? WelcomeViewController else { return }
            welcomeViewController.user = login
    }
    
    @IBAction func loginPressed() {
        if userNameTextField.text == login && passwordtextFeild.text == password {
        performSegue(withIdentifier: "segueWelcomeVC", sender: nil)
        } else {
            return
        }
    }
    
}

