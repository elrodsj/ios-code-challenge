//
//  AlbumView.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/5/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class AlbumView: UIView {
    
    var artworkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var tracksTableView: UITableView = {
        var tableView = UITableView()
        tableView.rowHeight = 40
        tableView.backgroundColor = UIColor.clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        
        addSubview(artworkImageView)
        addSubview(albumLabel)
        addSubview(artistLabel)
        addSubview(tracksTableView)
        
        self.setNeedsUpdateConstraints()
    }
    
    fileprivate func setConstraints() {
        let tableViewConstraints = [
            self.artworkImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: UIElementSizes.navigationBarMaxY + 25),
            self.artworkImageView.widthAnchor.constraint(equalTo: self.artworkImageView.heightAnchor),
            self.artworkImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            self.albumLabel.topAnchor.constraint(equalTo: self.artworkImageView.topAnchor),
            self.albumLabel.leadingAnchor.constraint(equalTo: self.artworkImageView.trailingAnchor, constant: 16),
            self.albumLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            self.artistLabel.topAnchor.constraint(equalTo: self.albumLabel.bottomAnchor, constant: 4),
            self.artistLabel.leadingAnchor.constraint(equalTo: self.albumLabel.leadingAnchor),
            self.artistLabel.trailingAnchor.constraint(equalTo: self.albumLabel.trailingAnchor),
            
            self.tracksTableView.topAnchor.constraint(equalTo: self.artworkImageView.bottomAnchor, constant: 16),
            self.tracksTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tracksTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tracksTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }
}
