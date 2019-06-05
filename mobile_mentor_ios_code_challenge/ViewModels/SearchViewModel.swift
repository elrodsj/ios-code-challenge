//
//  SearchViewModel.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

struct SearchViewModel {
    var model = SearchHistoryModel()
    
    mutating func search(term: String) {
        self.model.search(term: term)
    }
    
    mutating func clearSearches() {
        self.model.clear()
    }
    
    func getSearch(atIndex index: Int) -> SearchModel? {
        return self.model.getSearch(atIndex: index)
    }
}
