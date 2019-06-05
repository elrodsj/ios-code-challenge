//
//  AppDelegate.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Jeremy Barger on 2/12/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let viewController = LoginController()
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        
        UINavigationBar.appearance().barTintColor = UIColor.navigationBarBarTint
        UINavigationBar.appearance().tintColor = UIColor.navigationBarTint
        //you don't have to use hex everywhere...
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UINavigationBar.appearance().barStyle = .blackOpaque
        
        return true
    }
}

