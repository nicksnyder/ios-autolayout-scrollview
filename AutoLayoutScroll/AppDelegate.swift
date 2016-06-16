//
//  AppDelegate.swift
//  AutoLayoutScroll
//
//  Created by Nick Snyder on 6/15/16.
//  Copyright © 2016 Nick Snyder. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.redColor()
        self.window?.rootViewController = UINavigationController(rootViewController: MenuViewController())
        self.window?.makeKeyAndVisible()
        return true
    }

}

