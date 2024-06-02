//
//  ViewController.swift
//  EnterToApp
//
//  Created by Артур Бирюков on 25.05.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IBOutlat
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var logInButton: UIButton!
    
    // MARK: - values User and Password
    private let userName = "123"
    private let password = "321"
    
    // MARK: - prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let wellcomeVC = segue.destination as? PageWellcomeViewController else { return }
        wellcomeVC.userName = userName
    }
    
    // MARK: - Keyboard touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - forgot User and Password
    @IBAction func forgotUserNameButton() {
        showAlert(withTitle: "Oops!", andMessage: "Your name is \(userName)")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(withTitle: "Oops!", andMessage: "Your password is \(password)")
    }
    
    // MARK: - Log In
    @IBAction func logIngButtonTapped() {
        guard
            let inputName = userNameTF.text, !inputName.isEmpty,
            let inputPassword = passwordTF.text, !inputPassword.isEmpty
        else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password")
            return
        }
        
        if inputName == userName && inputPassword == password {
            performSegue(withIdentifier: "showNextScreen", sender: self)
        } else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password")
        }
    }
    
    // MARK: - Unwind
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        if segue.identifier == "unwindToLogin" {
                userNameTF.text = ""
                passwordTF.text = ""
        }
    }
    
    // MARK: - Alert
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "OK",
            style: .default
        ) { _ in
            self.userNameTF.text = ""
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
