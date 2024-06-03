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

    var user: User?
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = User(login: "User", password: "1234")
        
        if let user = user {
            userNameTF.text = user.login
            passwordTF.text = user.password
        }
    }
    // MARK: - Keyboard touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    // MARK: - Transition check
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTF.text == user?.login, passwordTF.text == user?.password else {
            showAlert(
                withTitle: "Неверный логин или пароль",
                andMessage: "Пожалуйста, введите правильный логин или пароль"
            )
            return false
        }
        return true
    }
    
    // MARK: - forgot User and Password
    @IBAction func forgotUserNameButton() {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your name is \(user?.login ?? "unknown")"
        )
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(
            withTitle: "Oops!",
            andMessage: "Your password is \(user?.password ?? "unknown")"
        )
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
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
