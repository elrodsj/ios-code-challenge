//
//  SearchController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
        
    let mainView: SearchView = { return SearchView() }()
    var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mainView.frame = view.bounds
    }
    
    fileprivate func setupView() {
        mainView.searchTextField.delegate = self
        mainView.searchHistoryTableView.delegate = self
        mainView.searchHistoryTableView.dataSource = self
        
        mainView.searchHistoryTableView.rowHeight = 44
        mainView.searchHistoryTableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "searchCell")
        
        mainView.searchHistoryTableViewHeader.clearButton.addTarget(self, action: #selector(clear), for: .touchUpInside)
        
        mainView.searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        
        let dismissKeyboardTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        dismissKeyboardTapGestureRecognizer.cancelsTouchesInView = false
        mainView.addGestureRecognizer(dismissKeyboardTapGestureRecognizer)
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOut))
        
        //I'm cheating here for lack of time.
        /*
        We really should make some sort of AuthenicationManager that not only stores the current loggeed in user,
         but also manages the validity of the users. This would allow us to expand authentication to using
         api calls (which is would eventually need to do) without having to significantly modify other code.
         */
        self.navigationItem.title = UserAccountViewModel.userEmail
        
        view.addSubview(mainView)
    }
    
    @objc func signOut() {
        UserAccountViewModel.userEmail = nil
        self.dismiss(animated: true)
    }
    
    @objc func clear() {
        self.viewModel.clearSearches()
        self.mainView.searchHistoryTableView.reloadData()
    }
    
    @objc func search() {
        guard let searchTerm = self.mainView.searchTextField.text else {
            return
        }
        
        if searchTerm.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let alert = UIAlertController.withCancelAction(title: "Invalid Search", message: "Please enter a valid search term and try again.")
            self.present(alert, animated: true) {
                self.mainView.searchTextField.becomeFirstResponder()
            }
        } else {
            self.viewModel.search(term: searchTerm)
            self.mainView.searchHistoryTableView.isHidden = false
            self.mainView.searchHistoryTableView.reloadData()
            
            iTunesApiClient.shared.getSearchSongs(searchTerm: searchTerm, success: { [weak self] (response) in
                let results = response.results.compactMap({ (apiResult) -> SearchResultModel? in
                    return try? SearchResultModel(result: apiResult)
                })
                
                DispatchQueue.main.async {
                    let resultsController = ResultsController()
                    resultsController.viewModel = SearchResultsViewModel(searchTerm: searchTerm, searchResults: results)
                    self?.navigationController?.pushViewController(resultsController, animated: true)
                }
            }, failure: { (error) in
                print(error) //should have an alert here
            })
        }
    }
    
    @objc fileprivate func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension SearchController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension SearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let search = viewModel.getSearch(atIndex: indexPath.row) else {
            return
        }
        self.mainView.searchTextField.text = search.term
        self.search()
    }
}

extension SearchController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        cell.searchModel = self.viewModel.getSearch(atIndex: indexPath.row)!
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.model.searches.count
    }
}

