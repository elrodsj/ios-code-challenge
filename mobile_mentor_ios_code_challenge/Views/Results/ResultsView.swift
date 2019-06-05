//
//  ResultsView.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class ResultsView: UIView {
    
    var resultsTableView: UITableView = {
        var tableView = UITableView()
        tableView.rowHeight = 120
        tableView.backgroundColor = UIColor.clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        
        addSubview(resultsTableView)
        
        self.setNeedsUpdateConstraints()
    }
    
    fileprivate func setConstraints() {
        let tableViewConstraints = [
            self.resultsTableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.resultsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.resultsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.resultsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }
}
