//
//  CodingChallengeTextField.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class CodingChallengeTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
        self.backgroundColor = UIColor.textFieldBackground
        self.layer.borderColor = UIColor.textFieldBorder.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 25
        self.borderStyle = .line
        self.keyboardType = .alphabet
        self.contentVerticalAlignment = .center
        self.textAlignment = .center
        self.textColor = UIColor.white
        self.font = UIFont.avenirNextRegular(withSize: 20)
        self.returnKeyType = .done
        self.borderStyle = .none
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
