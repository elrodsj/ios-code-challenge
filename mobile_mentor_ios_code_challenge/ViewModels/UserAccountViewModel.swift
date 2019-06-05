//
//  UserAccountViewModel.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/13/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

struct UserAccountViewModel {
    
    //this is case that you'd actually want to use instance variables, but I'm having to pick my battles at this point...
    static var userEmail: String?
    
    static var userPassword: String?
    
    static func setUserDict() {
        let userID = UserAccounts.userAccountEmail.count > 0 ? UserAccounts.userAccountEmail.count : 0
        
        UserAccounts.userAccountEmail[userID] = UserAccountViewModel.userEmail
        UserAccounts.userPasswords[userID] = UserAccountViewModel.userPassword
    }
}
