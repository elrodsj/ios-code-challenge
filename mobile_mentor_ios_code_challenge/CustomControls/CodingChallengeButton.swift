//
//  CodingChallengeButton.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class CodingChallengeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
        self.titleLabel?.font = UIFont.avenirNextDemiBold(withSize: 25)
        self.setTitleColor(UIColor.buttonTitle, for: .normal)
        self.backgroundColor = UIColor.black.withAlphaComponent(0)
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.black.withAlphaComponent(0).cgColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
