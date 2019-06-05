//
//  AlbumController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/5/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit
import PINRemoteImage

class AlbumController: UIViewController {
    
    let mainView: AlbumView = { return AlbumView() }()
    var viewModel = SearchResultsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.sort()
        
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mainView.frame = view.bounds
    }
    
    fileprivate func setupView() {
        mainView.tracksTableView.dataSource = self
        
        if let first = self.viewModel.searchResults.first {
            mainView.artworkImageView.pin_setImage(from: first.artworkUrl)
            mainView.albumLabel.text = first.albumName
            mainView.artistLabel.text = first.artistName
        }
        
        mainView.tracksTableView.register(AlbumTrackTableViewCell.self, forCellReuseIdentifier: "trackCell")
        
        self.navigationItem.title = self.viewModel.searchTerm
        
        view.addSubview(mainView)
    }
}

extension AlbumController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackCell", for: indexPath) as! AlbumTrackTableViewCell
        cell.result = self.viewModel.searchResults[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.searchResults.count
    }
}
