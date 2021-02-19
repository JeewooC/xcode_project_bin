//
//  AppDelegate.swift
//  AboutMe
//
//  Created by Jeewoo Chung on 7/16/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = UITabBarController()
        // view controllers
        let bioVC = BioViewController()
        bioVC.tabBarItem = UITabBarItem(title: "Bio", image: UIImage.init(named: "B"), selectedImage: UIImage.init(named: "B Selected"))
        
        let familyVC = FamilyViewController()
        familyVC.tabBarItem = UITabBarItem(title: "Family", image: UIImage.init(named: "Y"), selectedImage: UIImage.init(named: "Y Selected"))
        
        let hobbyVC = HobbyViewController()
        hobbyVC.tabBarItem = UITabBarItem(title: "Hobby", image: UIImage.init(named: "O"), selectedImage: UIImage.init(named: "O Selected"))
        
        tabBarController.viewControllers = [
            bioVC, familyVC, hobbyVC
        ]
        
        window?.rootViewController = tabBarController
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
