//
//  ResultsTableViewCell.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit
import PINRemoteImage

class ResultsTableViewCell: UITableViewCell {
    
    var trackNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.searchResult
        label.font = UIFont.avenirNextDemiBold(withSize: 17)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var albumLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.searchResult
        label.font = UIFont.avenirNextDemiBold(withSize: 13)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.searchResult
        label.font = UIFont.avenirNextRegular(withSize: 13)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var artworkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var result: SearchResultModel! {
        didSet {
            self.trackNameLabel.text = result.trackName
            self.artistLabel.text = result.artistName
            self.albumLabel.text = result.albumName
            
            self.artworkImageView.pin_setImage(from: result.artworkUrl)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        self.backgroundColor = UIColor.clear
        
        self.contentView.addSubview(self.trackNameLabel)
        self.contentView.addSubview(self.albumLabel)
        self.contentView.addSubview(self.artistLabel)
        self.contentView.addSubview(self.artworkImageView)
        
        let constraints = [
            self.artworkImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.artworkImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.artworkImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.artworkImageView.widthAnchor.constraint(equalTo: self.artworkImageView.heightAnchor),
            
            self.trackNameLabel.topAnchor.constraint(equalTo: self.artworkImageView.topAnchor),
            self.trackNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.trackNameLabel.leadingAnchor.constraint(equalTo: self.artworkImageView.trailingAnchor, constant: 16),
            
            self.albumLabel.topAnchor.constraint(equalTo: self.trackNameLabel.bottomAnchor, constant: -2),
            self.albumLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.albumLabel.leadingAnchor.constraint(equalTo: self.trackNameLabel.leadingAnchor),
            
            self.artistLabel.topAnchor.constraint(equalTo: self.albumLabel.bottomAnchor, constant: 2),
            self.artistLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.artistLabel.leadingAnchor.constraint(equalTo: self.trackNameLabel.leadingAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
