//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Derrick Park on 2019-06-22.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let TBC = UITabBarController()
    // Vancouver
    let Vancouver = City.init(countryName: "CANADA", countryEmoji: "🇨🇦", cityName: "Vancouver", temp: 15.5, summary: "Clear")
    let VancouverVC = CityViewController()
    VancouverVC.city = Vancouver
    VancouverVC.tabBarItem = UITabBarItem(title: "Canada", image: UIImage.init(named: "G"), tag: 0)
    // Seoul
    let Seoul = City.init(countryName: "KOREA", countryEmoji: "🇰🇷", cityName: "Seoul", temp: 25.4, summary: "Sunny")
    let SeoulVC = CityViewController()
    SeoulVC.city = Seoul
    SeoulVC.tabBarItem = UITabBarItem(title: "Korea", image: UIImage.init(named: "O"), tag: 1)
    // Sydney
    let Sydney = City.init(countryName: "AUSTRALIA", countryEmoji: "🇦🇺", cityName: "Sydney", temp: 12.0, summary: "Cloudy")
    let SydneyVC = CityViewController()
    SydneyVC.city = Sydney
    SydneyVC.tabBarItem = UITabBarItem(title: "Australia", image: UIImage.init(named: "R"), tag: 2)
    // Madrid
    let Madrid = City.init(countryName: "SPAIN", countryEmoji: "🇪🇸", cityName: "Madrid", temp: 36.8, summary: "Scorching")
    let MadridVC = CityViewController()
    MadridVC.city = Madrid
    MadridVC.tabBarItem = UITabBarItem(title: "Spain", image: UIImage.init(named: "Y"), tag: 3)
    // Paris
    let Paris = City.init(countryName: "FRANCE", countryEmoji: "🇫🇷", cityName: "Paris", temp: 21.4, summary: "Light drizzle")
    let ParisVC = CityViewController()
    ParisVC.city = Paris
    ParisVC.tabBarItem = UITabBarItem(title: "France", image: UIImage.init(named: "B"), tag: 4)
    
    let controllers: [CityViewController] = [VancouverVC, SeoulVC, SydneyVC, MadridVC, ParisVC]
    
    TBC.viewControllers = controllers.map {
        UINavigationController(rootViewController: $0)
    }
    
    window?.makeKeyAndVisible()
    window?.rootViewController = TBC
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

