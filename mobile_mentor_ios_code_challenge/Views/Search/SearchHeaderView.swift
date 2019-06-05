//
//  SearchTableViewHeaderView.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class SearchHeaderView: UIView {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Search History"
        label.font = UIFont.avenirNextDemiBold(withSize: 15)
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var clearButton: UIButton = {
        let button = UIButton()
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(UIColor.buttonTitle, for: .normal)
        button.titleLabel?.font = UIFont.avenirNextDemiBold(withSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
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
        
        backgroundColor = UIColor.searchHeaderBackground
        
        addSubview(titleLabel)
        addSubview(clearButton)
        
        self.setNeedsUpdateConstraints()
    }
    
    fileprivate func setConstraints() {
        let constraints = [
            NSLayoutConstraint(item: self.titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.titleLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.clearButton, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.clearButton, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -16)
            ]
        NSLayoutConstraint.activate(constraints)
    }
}
