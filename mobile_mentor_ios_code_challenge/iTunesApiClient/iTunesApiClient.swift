//
//  iTunesApiClient.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

enum iTunesApiClientError: Error {
    case unkown
    case httpStatusCode(code: Int)
    case missingData
}

//i made it this way so it could eventually be expanded for other calls if necessary
class iTunesApiClient {
    static let shared = iTunesApiClient()
    
    private let urlSession: URLSession
    
    //maybe put this in build configuration?
    static let baseUrl = URL(string: "http://itunes.apple.com")!
    
    private init() {
        self.urlSession = URLSession(configuration: .default)
    }
    
    func request(request: URLRequest, success: @escaping (Data?) -> Void, failure: @escaping (Error) -> Void) {
        self.urlSession.dataTask(with: request) { (data, response, error) in
            
            //could probably refactor this with some guard statements and simplified logic
            
            if let error = error {
                failure(error)
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if 200..<300 ~= httpResponse.statusCode {
                    success(data)
                } else {
                    //handle other error appropriately - might come back if I have time
                    failure(iTunesApiClientError.httpStatusCode(code: httpResponse.statusCode))
                }
            } else {
                failure(iTunesApiClientError.unkown)
            }
        }.resume()
    }
    
    func get<ResponseType: Decodable>(url: URL, success: @escaping (ResponseType) -> Void, failure: @escaping (Error) -> Void) {
        let request = URLRequest(url: url)
        self.request(request: request, success: { (data) in
            guard let data = data else {
                failure(iTunesApiClientError.missingData)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(ResponseType.self, from: data)
                success(response)
            } catch let error {
                failure(error)
            }
        }, failure: failure)
    }
}
