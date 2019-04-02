//
//  AppDelegate.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 29.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let rootRouter = RootRouter()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let listPostsViewController = ListPostsViewController()
        let rootNavigationViewController = UINavigationController(rootViewController: listPostsViewController)
        rootRouter.root(&window, rootViewController: rootNavigationViewController)        
        return true
    }
}

