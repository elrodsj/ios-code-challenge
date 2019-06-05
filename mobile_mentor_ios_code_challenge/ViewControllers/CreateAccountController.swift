//
//  CreateAccountController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/5/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class CreateAccountController: UIViewController, UITextFieldDelegate {
    
    let mainView: CreateAccountView = { return CreateAccountView() }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mainView.frame = view.bounds
    }
    
    fileprivate func setupView() {
        mainView.emailTextField.delegate = self
        mainView.passwordTextField1.delegate = self
        mainView.passwordTextField2.delegate = self
        
        mainView.passwordTextField1.becomeFirstResponder()
        
        mainView.emailTextField.text = UserAccountViewModel.userEmail
        
        mainView.createAccountButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
        
        let dismissKeyboardTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        dismissKeyboardTapGestureRecognizer.cancelsTouchesInView = false
        mainView.addGestureRecognizer(dismissKeyboardTapGestureRecognizer)
        
        self.navigationItem.title = "Create Account"
        
        view.addSubview(mainView)
    }
    
    @objc fileprivate func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func createAccount() {
        guard let email = UserAccountViewModel.userEmail,
            let password1 = self.mainView.passwordTextField1.text,
            let password2 = self.mainView.passwordTextField2.text else {
            return
        }
        
        if password1 == password2 {
            UserAccountViewModel.userPassword = password1
            UserAccountViewModel.setUserDict()
            let alert = UIAlertController(title: "Account Created", message: "Your account - \(email) - was created successfully.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
                NotificationCenter.default.post(name: NSNotification.Name("accountCreated"), object: nil)
            }))
            self.present(alert, animated: true)
        } else {
            self.mainView.passwordTextField1.text = ""
            self.mainView.passwordTextField2.text = ""
            
            let alert = UIAlertController.withCancelAction(title: "Passwords Do Not Match", message: "The passwords that you entered do not match. Please re-enter them and try again.")
            self.present(alert, animated: true) {
                self.mainView.passwordTextField1.becomeFirstResponder()
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

