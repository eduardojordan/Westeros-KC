//
//  AppDelegate.swift
//  Westeros
//
//  Created by Eduardo on 6/9/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .cyan
        
    //  Creamos los modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        

    // Creamos los controladores
        
        let houseListViewController = HouseListViewController(model: houses)
        let lastHouseSelected = houseListViewController.lastSelectHouse()
        
        var houseDetailViewController: HouseDetailViewController!
        houseDetailViewController = HouseDetailViewController(model: lastHouseSelected)
       
        
        let seasonListViewController = SeasonListViewController(model:seasons)
        let seasonDetailViewController: SeasonDetailViewController!
        seasonDetailViewController = SeasonDetailViewController(model: seasons.first!)
        
        
    // Creamos los navigation
        var houseListViewNavigation : UINavigationController!
        houseListViewNavigation = houseListViewController.wrappedInNavigation()
        var seasonListViewNavigation: UINavigationController!
        seasonListViewNavigation = seasonListViewController.wrappedInNavigation()
       
        var houseDetailViewNavigation: UINavigationController!
        houseDetailViewNavigation = houseDetailViewController.wrappedInNavigation()
       
        var seasonDetailViewNavigation: UINavigationController!
        seasonDetailViewNavigation = seasonDetailViewController.wrappedInNavigation()
    
    // Creaamos el TabBar
        let tabBarViewController = UITabBarController()
        tabBarViewController.viewControllers = [houseListViewNavigation, seasonListViewNavigation]

       let splitViewController = UISplitViewController()
       splitViewController.viewControllers = [tabBarViewController, houseDetailViewNavigation, seasonDetailViewNavigation]
        
    // El RootVC
        
        window?.rootViewController = splitViewController
        window?.makeKeyAndVisible()
        return true
    }
    
}


//    func applicationWillResignActive(_ application: UIApplication) {
//        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
//    }
//    
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    }
//    
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
//    }
//    
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    }
//    
//    func applicationWillTerminate(_ application: UIApplication) {
//        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    }

    

