//
//  AlbumTableViewCell.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/5/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit
import PINRemoteImage

class AlbumTrackTableViewCell: UITableViewCell {
    
    var trackNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.searchResult
        label.font = UIFont.avenirNextDemiBold(withSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var trackNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.searchResult
        label.font = UIFont.avenirNextDemiBold(withSize: 17)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var result: SearchResultModel! {
        didSet {
            self.trackNameLabel.text = result.trackName
            self.trackNumberLabel.text = "\(result.trackNumber)"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        self.backgroundColor = UIColor.clear
        
        self.contentView.addSubview(self.trackNameLabel)
        self.contentView.addSubview(self.trackNumberLabel)
        
        let constraints = [
            self.trackNumberLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.trackNumberLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            
            self.trackNameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.trackNameLabel.leadingAnchor.constraint(equalTo: self.trackNumberLabel.leadingAnchor, constant: 8),
            self.trackNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 16),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

