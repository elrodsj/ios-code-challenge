//
//  SearchResultModel.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/5/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

enum SearchResultModelError: Error {
    case invalidApiModel
}

struct SearchResultModel {
    let trackName: String
    let albumName: String
    let albumId: Int
    let artistName: String
    let artworkUrl: URL
    let trackNumber: Int
    
    init(result: iTunesApiClient.GetSearchSongsResponse.GETSearchSongsResponseResult) throws {
        guard let trackName = result.trackName,
            let artworkUrlString = result.artworkUrl100,
            let artworkUrl = URL(string: artworkUrlString),
            let trackNumber = result.trackNumber else {
            throw SearchResultModelError.invalidApiModel
        }
        
        self.trackName = trackName
        self.albumName = result.collectionName
        self.artistName = result.artistName
        self.artworkUrl = artworkUrl
        self.trackNumber = trackNumber
        self.albumId = result.collectionId
    }
}
