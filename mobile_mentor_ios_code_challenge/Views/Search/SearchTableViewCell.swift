//
//  SearchTableViewCell.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    var searchTermLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.searchTerm
        label.font = UIFont.avenirNextRegular(withSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.searchTerm
        label.font = UIFont.avenirNextRegular(withSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var searchModel: SearchModel! {
        didSet {
            self.searchTermLabel.text = self.searchModel.term
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            self.dateLabel.text = formatter.string(from: self.searchModel.date)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clear
        
        self.contentView.addSubview(self.searchTermLabel)
        self.contentView.addSubview(self.dateLabel)
        
        let constraints = [
            NSLayoutConstraint(item: self.searchTermLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1, constant: 4),
            NSLayoutConstraint(item: self.searchTermLabel, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.dateLabel, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1, constant: -4),
            NSLayoutConstraint(item: self.dateLabel, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
