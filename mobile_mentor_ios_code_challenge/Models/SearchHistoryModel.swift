//
//  SearchHistoryModel.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

struct SearchHistoryModel {
    var searches = [SearchModel]()
    
    mutating func search(term: String) {
        let search = SearchModel(term: term)
        self.searches.append(search)
    }
    
    mutating func clear() {
        self.searches = [SearchModel]()
    }
    
    func getSearch(atIndex index: Int) -> SearchModel? {
        guard 0..<self.searches.count ~= index else {
            return nil
        }
        return self.searches[index]
    }
}
