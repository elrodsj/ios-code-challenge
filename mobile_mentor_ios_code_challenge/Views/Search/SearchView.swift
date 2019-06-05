//
//  SearchView.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    var searchHistoryTableViewHeader: SearchHeaderView = {
        let view = SearchHeaderView(frame: CGRect(x: 0, y: 0, width: 0, height: 30))
        return view
    }()
    
    var searchHistoryTableView: UITableView = {
        var tableView = UITableView()
        tableView.isHidden = true
        tableView.backgroundColor = UIColor.clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var searchTextField: UITextField = {
        let textField = CodingChallengeTextField()
        textField.attributedPlaceholder = NSAttributedString(string: "*enter artist/song name*", attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "#FFFFFF", alpha: 0.5)])
        return textField
    }()
    
    var searchButton: UIButton = {
        let button = CodingChallengeButton()
        button.setTitle("Search", for: .normal)
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
        
        self.searchHistoryTableView.tableHeaderView = self.searchHistoryTableViewHeader
        
        addSubview(searchTextField)
        addSubview(searchButton)
        addSubview(searchHistoryTableView)
        
        self.setNeedsUpdateConstraints()
    }
    
    fileprivate func setConstraints() {
        NSLayoutConstraint.constraintWithTopAndCenterXAnchor(field: searchTextField, width: UIElementSizes.textFieldWidth, height: 50, topAnchor: topAnchor, topConstant: UIElementSizes.navigationBarMaxY + 40, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        NSLayoutConstraint.constraintWithTopAndCenterXAnchor(field: searchButton, width: UIElementSizes.textFieldWidth, height: 50, topAnchor: searchTextField.bottomAnchor, topConstant: 25, centerXAnchor: centerXAnchor, centerXConstant: 0)
        
        let tableViewConstraints = [
            self.searchHistoryTableView.topAnchor.constraint(equalTo: self.searchButton.bottomAnchor, constant: 25),
            self.searchHistoryTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.searchHistoryTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.searchHistoryTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }
}

