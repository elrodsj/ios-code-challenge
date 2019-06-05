//
//  iTunesApiClient+GETSongs.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/5/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

extension iTunesApiClient {
    //i like prefix every func with the http method. for this case it's not particularly useful,
    //but when you are using POST, GET, PUT, etc it becomes useful
    func getSearchSongs(searchTerm: String, success: @escaping (GetSearchSongsResponse) -> Void, failure: @escaping (Error) -> Void) {
        var components = URLComponents(url: iTunesApiClient.baseUrl.appendingPathComponent("search"), resolvingAgainstBaseURL: false)
        components?.queryItems = [
            URLQueryItem(name: "entity", value: "song"),
            URLQueryItem(name: "term", value: searchTerm)
        ]
        
        guard let url = components?.url else {
            failure(iTunesApiClientError.unkown)
            return
        }
        
        self.get(url: url, success: success, failure: failure)
    }
    
    struct GetSearchSongsResponse: Decodable {
        let resultCount: Int
        let results: [GETSearchSongsResponseResult]
        
        struct GETSearchSongsResponseResult: Decodable {
            let wrapperType: String
            
            //there are better ways to handle the nils (for "audiobook" wrapperType) here while using a form of Decodable
            let trackName: String?
            let artistName: String
            let collectionName: String
            let artworkUrl100: String?
            let trackNumber: Int?
            let collectionId: Int
        }
    }
}
