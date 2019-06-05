//
//  CreateAlertController.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation
import UIKit

//let's put these factory pattern methods in a context that makes sense
//should probably make them initializers, but I have bigger fish to fry right now
//without having to figure out the parameter names I would need to use for the three initializers
//having the same type and number of fields
extension UIAlertController {
    static func withCancelAction(title: String, message: String) -> UIAlertController {
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(cancelAction)
        
        return alertController
    }
}
