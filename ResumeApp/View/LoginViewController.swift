//
//  LoginViewController.swift
//  ResumeApp
//
//  Created by Aleksandr on 29.08.2020.
//  Copyright © 2020 Aleksandr Lukash. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var loggedUser: User! = nil
    
    override func viewDidLoad() {
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController =
            segue.destination as? UITabBarController else { return }
        guard let aboutVC =
            tabBarController.viewControllers?.first as? AboutViewController
            else { return }
        guard let hobbiesVC =
            tabBarController.viewControllers?.last as? HobbiesViewController
            else { return }
        aboutVC.loggedUser = loggedUser
        hobbiesVC.loggedUser = loggedUser
    }
    
    @IBAction func loginButtonTapped() {
        let candidate = User(login: loginTextField.text ?? "",
                             password: passwordTextField.text ?? "")
        
        if isAuthenticated(candidate: candidate) {
            loggedUser = candidate
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            showAlert(title: "Invalid username or password",
                      message: "Please provide correct username or password",
                      buttonHandler: { _ in
                        self.passwordTextField.text = ""
            })
        }
    }
    
    @IBAction func remindUsername() {
        let login = User.getInMemoryUser().login
        showAlert(title: "Hint", message: "Your login: \(login)")
    }
    
    @IBAction func remindPassword() {
        let password = User.getInMemoryUser().password
        showAlert(title: "Hint", message: "Your password: \(password)")
    }
    
    @IBAction func unwindSegueToLoginView(segue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func isAuthenticated(candidate: User) -> Bool {
        let inMemoryUser = User.getInMemoryUser()
        
        return inMemoryUser == candidate
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else { loginButtonTapped() }
        
        return true
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(title: String,
                           message: String,
                           buttonHandler: ((UIAlertAction) ->Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .cancel,
                                     handler: buttonHandler)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
