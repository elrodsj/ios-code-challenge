//
//  CreateAccountView.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/5/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class CreateAccountView: UIView {
    
    var emailTextField: UITextField = {
        let textField = CodingChallengeTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "*email*", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    var passwordTextField1: UITextField = {
        let textField = CodingChallengeTextField()
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(string: "*password*", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        return textField
    }()
    
    var passwordTextField2: UITextField = {
        let textField = CodingChallengeTextField()
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(string: "*confirm password*", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        return textField
    }()
    
    var createAccountButton: UIButton = {
        let button = CodingChallengeButton()
        button.setTitle("CREATE ACCOUNT", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        self.setConstraints()
        super.updateConstraints()
    }
    
    fileprivate func setupView() {
        
        backgroundColor = UIColor.mainBackground
        
        passwordTextField1.isSecureTextEntry = true
        passwordTextField2.isSecureTextEntry = true
        
        addSubview(emailTextField)
        addSubview(passwordTextField1)
        addSubview(passwordTextField2)
        addSubview(createAccountButton)
        
        self.setNeedsUpdateConstraints()
    }
    
    fileprivate func setConstraints() {
        NSLayoutConstraint.constraintWithTopAndCenterXAnchor(field: emailTextField, width: UIElementSizes.textFieldWidth, height: 50, topAnchor: topAnchor, topConstant: UIElementSizes.navigationBarMaxY + 75, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        NSLayoutConstraint.constraintWithTopAndCenterXAnchor(field: passwordTextField1, width: UIElementSizes.textFieldWidth, height: 50, topAnchor: emailTextField.bottomAnchor, topConstant: 16, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        NSLayoutConstraint.constraintWithTopAndCenterXAnchor(field: passwordTextField2, width: UIElementSizes.textFieldWidth, height: 50, topAnchor: passwordTextField1.bottomAnchor, topConstant: 16, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        NSLayoutConstraint.constraintWithTopAndCenterXAnchor(field: createAccountButton, width: UIElementSizes.textFieldWidth, height: UIElementSizes.buttonHeight, topAnchor: passwordTextField2.bottomAnchor, topConstant: 16, centerXAnchor: centerXAnchor, centerXConstant: 0)
    }
}
