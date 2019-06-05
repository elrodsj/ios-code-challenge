//
//  LoginView.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

//let's keep the names in sync
class LoginView: UIView {
    
    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var emailTextField: UITextField = {
        let textField = CodingChallengeTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "*email*", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = CodingChallengeTextField()
        textField.isSecureTextEntry = true
        textField.attributedPlaceholder = NSAttributedString(string: "*password*", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)])
        return textField
    }()
    
    var loginButton: UIButton = {
        let button = CodingChallengeButton()
        button.setTitle("LOGIN", for: .normal)
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
        
        setLogoImageViewImage()
        
        passwordTextField.isSecureTextEntry = true
        
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        self.setNeedsUpdateConstraints()
    }
    
    fileprivate func setLogoImageViewImage() {
        
        let image = UIImage(named: "logo_400x400")
        
        logoImageView.image = image
        
    }
    
    fileprivate func setConstraints() {
        NSLayoutConstraint.constraintWithTopAndCenterXAnchor(field: logoImageView, width: 150, height: 150, topAnchor: topAnchor, topConstant: UIElementSizes.navigationBarMaxY + 75, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        NSLayoutConstraint.constraintWithTopAndCenterXAnchor(field: emailTextField, width: UIElementSizes.textFieldWidth, height: 50, topAnchor: logoImageView.bottomAnchor, topConstant: 25, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        NSLayoutConstraint.constraintWithTopAndCenterXAnchor(field: passwordTextField, width: UIElementSizes.textFieldWidth, height: 50, topAnchor: emailTextField.bottomAnchor, topConstant: 15, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        NSLayoutConstraint.constraintWithTopAndCenterXAnchor(field: loginButton, width: UIElementSizes.buttonWidth, height: UIElementSizes.buttonHeight, topAnchor: passwordTextField.bottomAnchor, topConstant: 25, centerXAnchor: centerXAnchor, centerXConstant: 0)
    }
}
