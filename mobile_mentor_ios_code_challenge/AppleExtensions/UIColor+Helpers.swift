//
//  UIColor+Helpers.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jake Elrod on 6/4/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainBackground = UIColor(hexString: "#323F44", alpha: 1)
    static var buttonTitle = UIColor(hexString: "#50A3E3", alpha: 1)
    static var textFieldBorder = UIColor(hexString: "#2590E3", alpha: 1)
    static var textFieldBackground = UIColor(hexString: "#0463AC", alpha: 1)
    static var navigationBarTint = UIColor(hexString: "#ABAFB0", alpha: 1)
    static var navigationBarBarTint = UIColor(hexString: "#D63031", alpha: 1)
    static var searchHeaderBackground = UIColor(hexString: "#D63031", alpha: 1)
    static var searchTerm = UIColor(hexString: "#50A3E3", alpha: 1)
    static var searchResult = UIColor(hexString: "#50A3E3", alpha: 1)
    
    //swift has some nice features, let's use them...
    convenience init(hexString: String, alpha:CGFloat = 1.0) {
        let hexint = Int(UIColor.int(withHexString: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    //udpated for Swift naming conventions.
    //no reason for this to be an instance func on UIColor
    //might make sense to move this to an extension of String. may have uses in other contexts
    //i.e. "hexString".hexToInt()
    static func int(withHexString hexString: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexString)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
}
