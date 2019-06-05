//
//  Constraints.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation
import UIKit

//these are only utility methods. we don't need any instances created of this class
//let's move thes methods to a class that has appropriate context
extension NSLayoutConstraint {
    
    static func constraintWithTopAndLeadingAnchor(field: AnyObject, width: CGFloat, height: CGFloat, topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, topConstant: CGFloat, leadingAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, leadingConstant: CGFloat) {
        
        field.widthAnchor.constraint(equalToConstant: width).isActive = true
        field.heightAnchor.constraint(equalToConstant: height).isActive = true
        field.topAnchor.constraint(equalTo: topAnchor, constant: topConstant).isActive = true
        field.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingConstant).isActive = true
        
    }
    
    static func constraintWithTopAndTrailingAnchor(field: AnyObject, width: CGFloat, height: CGFloat, topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, topConstant: CGFloat, trailingAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, trailingConstant: CGFloat) {
        
        field.widthAnchor.constraint(equalToConstant: width).isActive = true
        field.heightAnchor.constraint(equalToConstant: height).isActive = true
        field.topAnchor.constraint(equalTo: topAnchor, constant: topConstant).isActive = true
        field.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailingConstant).isActive = true
        
    }
    
    static func constraintWithBottomAndLeading(field: AnyObject, width: CGFloat, height: CGFloat, bottomAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, bottomConstant: CGFloat, leadingAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, leadingConstant: CGFloat) {
        
        field.widthAnchor.constraint(equalToConstant: width).isActive = true
        field.heightAnchor.constraint(equalToConstant: height).isActive = true
        field.topAnchor.constraint(equalTo: bottomAnchor, constant: bottomConstant).isActive = true
        field.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingConstant).isActive = true
        
    }
    
    static func constraintWithTopAndCenterXAnchor(field: AnyObject, width: CGFloat, height: CGFloat, topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, topConstant: CGFloat, centerXAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, centerXConstant: CGFloat) {
        
        field.widthAnchor.constraint(equalToConstant: width).isActive = true
        field.heightAnchor.constraint(equalToConstant: height).isActive = true
        field.topAnchor.constraint(equalTo: topAnchor, constant: topConstant).isActive = true
        field.centerXAnchor.constraint(equalTo: centerXAnchor, constant: centerXConstant).isActive = true
        
    }
    
    static func constraintWithCenterYAnchorAndLeading(field: AnyObject, width: CGFloat, height: CGFloat, centerYAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, centerYConstant: CGFloat, leadingAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, leadingConstant: CGFloat) {
        
        field.widthAnchor.constraint(equalToConstant: width).isActive = true
        field.heightAnchor.constraint(equalToConstant: height).isActive = true
        field.centerYAnchor.constraint(equalTo: centerYAnchor, constant: centerYConstant).isActive = true
        field.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadingConstant).isActive = true
        
    }
    
    static func constraintWithCenterYAnchorAndTrailing(field: AnyObject, width: CGFloat, height: CGFloat, centerYAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, centerYConstant: CGFloat, trailingAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, trailingConstant: CGFloat) {
        
        field.widthAnchor.constraint(equalToConstant: width).isActive = true
        field.heightAnchor.constraint(equalToConstant: height).isActive = true
        field.centerYAnchor.constraint(equalTo: centerYAnchor, constant: centerYConstant).isActive = true
        field.trailingAnchor.constraint(equalTo: trailingAnchor, constant: trailingConstant).isActive = true
        
    }
    
    static func constraintWithCenterYAndCenterXAnchor(field: AnyObject, width: CGFloat, height: CGFloat, centerYAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, centerYConstant: CGFloat, centerXAnchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, centerXConstant: CGFloat) {
        
        field.widthAnchor.constraint(equalToConstant: width).isActive = true
        field.heightAnchor.constraint(equalToConstant: height).isActive = true
        field.centerYAnchor.constraint(equalTo: centerYAnchor, constant: centerYConstant).isActive = true
        field.centerXAnchor.constraint(equalTo: centerXAnchor, constant: centerXConstant).isActive = true
        
    }
}
