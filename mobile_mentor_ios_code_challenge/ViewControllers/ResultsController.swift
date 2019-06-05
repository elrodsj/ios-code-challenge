//
//  ResultsController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class ResultsController: UIViewController {
    
    let mainView: ResultsView = { return ResultsView() }()
    var viewModel = SearchResultsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mainView.frame = view.bounds
    }
    
    fileprivate func setupView() {
        mainView.resultsTableView.delegate = self
        mainView.resultsTableView.dataSource = self
        
        mainView.resultsTableView.register(ResultsTableViewCell.self, forCellReuseIdentifier: "resultCell")
        
        self.navigationItem.title = self.viewModel.searchTerm
        
        view.addSubview(mainView)
    }
}

extension ResultsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let result = self.viewModel.searchResults[indexPath.row]
        iTunesApiClient.shared.getSearchSongs(searchTerm: result.albumName, success: { [weak self] (response) in
            //searching an album name can return other results not in that album so filter
            //really should make a different call to itunes api based on album id
            //did a quick look for a new call, but didn't see an obvious one to us
            //unfortunately, this also highlights the fact that sometimes not all tracks in an album will be included
            //since tracks from other albums will be in the search and the results are limited to 50 :(
            //to see this issue search "The Beatles" and select a track from the album "Sgt. Pepper's Lonely Hearts Club Band"
            let results = response.results.compactMap({ (apiResult) -> SearchResultModel? in
                return try? SearchResultModel(result: apiResult)
            }).filter({ $0.albumId == result.albumId })
            
            DispatchQueue.main.async {
                let albumController = AlbumController()
                albumController.viewModel = SearchResultsViewModel(searchTerm: result.albumName, searchResults: results)
                self?.navigationController?.pushViewController(albumController, animated: true)
            }
            }, failure: { (error) in
                print(error) //should have an alert here
        })
    }
}

extension ResultsController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultsTableViewCell
        cell.result = self.viewModel.searchResults[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.searchResults.count
    }
}

