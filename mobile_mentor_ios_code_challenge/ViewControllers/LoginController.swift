//
//  LoginController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    let mainView: LoginView = { return LoginView() }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIElementSizes.navigationBarMaxY += navigationController!.navigationBar.frame.maxY
        
        setupUserAccounts()
        
        setupView()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("accountCreated"), object: nil, queue: OperationQueue.main) { [weak self] (_) in
            CATransaction.begin()
            CATransaction.setCompletionBlock({
                self?.presentSearch()
            })
            self?.navigationController?.popToRootViewController(animated: true)
            CATransaction.commit()
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mainView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainView.passwordTextField.text = ""
    }
    
    fileprivate func setupUserAccounts() {
        
        //if we're hard coding these and not validating them with regex's, then let's make them simple for testing sake
        //and this way is much safer and avoids potential array crashes and infinite repeats
        let defaultUserNamesAndPasswords: [(username: String, password: String)] = [("a", "b"), ("c", "d")]
        
        for (username, password) in defaultUserNamesAndPasswords {
            UserAccountViewModel.userEmail = username
            UserAccountViewModel.userPassword = password
            UserAccountViewModel.setUserDict()
        }
    }
    
    fileprivate func setupView() {
        mainView.emailTextField.delegate = self
        mainView.passwordTextField.delegate = self
        
        mainView.loginButton.addTarget(self, action: #selector(handleLoginButtonTap(sender:)), for: .touchUpInside)

        let dismissKeyboardTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        dismissKeyboardTapGestureRecognizer.cancelsTouchesInView = false
        mainView.addGestureRecognizer(dismissKeyboardTapGestureRecognizer)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
        view.addSubview(mainView)
    }
    
    @objc fileprivate func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func handleLoginButtonTap(sender: UIButton) {
        
        guard let emailAddress = mainView.emailTextField.text,
            let password = mainView.passwordTextField.text else { return }
        
        let emailAddressLowercased = emailAddress.lowercased()
        
        if let user = getUser(emailAddress: emailAddressLowercased) {
            guard let savedPassword = UserAccounts.userPasswords[user] else { return }
            UserAccountViewModel.userEmail = emailAddressLowercased
            comparePassword(password: password, savedPassword: savedPassword)
        } else {
            let alert = UIAlertController(title: "User Account Not Found", message: "The user account that you are attempting to use does not exist.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Create Account", style: .default, handler: { (_) in
                let createAccountController = CreateAccountController()
                UserAccountViewModel.userEmail = emailAddressLowercased
                self.navigationController?.pushViewController(createAccountController, animated: true)
            }))
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert, animated: true) {
                self.mainView.passwordTextField.text = ""
            }
        }
    }
    
    fileprivate func getUser(emailAddress: String) -> Int? {
        var dictKey: Int?
        for item in UserAccounts.userAccountEmail {
            if item.value == emailAddress {
                dictKey = item.key
            }
        }
        return dictKey
    }
    
    fileprivate func comparePassword(password: String, savedPassword: String) {
        if password == savedPassword {
            self.mainView.emailTextField.text = ""
            self.mainView.passwordTextField.text = ""
            
            self.presentSearch()
        } else {
            let alertController = UIAlertController.withCancelAction(title: "Incorrect Password", message: "Please re-enter your password and try again.")
            
            present(alertController, animated: true) {
                self.mainView.passwordTextField.text = ""
                self.mainView.passwordTextField.becomeFirstResponder()
            }
        }
    }
    
    func presentSearch() {
        let searchController = SearchController()
        let navigationController = UINavigationController(rootViewController: searchController)
        self.present(navigationController, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
