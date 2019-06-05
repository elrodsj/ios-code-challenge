//
//  ResultsViewModel.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

struct SearchResultsViewModel {
    var searchTerm = ""
    var searchResults = [SearchResultModel]()
    
    init() {}
    init(searchTerm: String, searchResults: [SearchResultModel]) {
        self.searchTerm = searchTerm
        self.searchResults = searchResults
    }
    
    mutating func sort() {
        self.searchResults.sort(by: { $0.trackNumber < $1.trackNumber })
    }
}
