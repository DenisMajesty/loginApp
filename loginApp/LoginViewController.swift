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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController = segue.destination as? WelcomeViewController else { return }
            welcomeViewController.user = login
    }
    
    @IBAction func loginPressed() {
        if userNameTextField.text == login && passwordtextFeild.text == password {
        performSegue(withIdentifier: "segueWelcomeVC", sender: nil)
        } else {
            showAlert(with: "Error", and: "The username or password was entered incorrectly.")
        }
    }
    
    @IBAction func helpPressed(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(with: "Oops", and: "Your login is \(login)")
        : showAlert(with: "Oops", and: "Your password is \(password)")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordtextFeild.text = ""
    }
}

// MARK: - Alert controller

extension ViewController {
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ok", style: .default) { _ in
            self.passwordtextFeild.text = ""
        }
        alert.addAction(alertOk)
        present(alert, animated: true)
    }
}

// MARK: - Work with keyboard

extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordtextFeild.becomeFirstResponder()
        } else {
            loginPressed()
        }
        return true
    }
    
}

