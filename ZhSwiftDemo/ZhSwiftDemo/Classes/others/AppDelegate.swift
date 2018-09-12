//
//  AppDelegate.swift
//  ZhSwiftDemo
//
//  Created by Zhuang on 2018/7/31.
//  Copyright © 2018年 Zhuang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = MyTabBarController()
        window?.makeKeyAndVisible()
        
        //navbar
        UINavigationBar.appearance().tintColor = KCOLOR_BAR_TEXT
        UINavigationBar.appearance().barTintColor = UIColor.orange
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black,NSAttributedStringKey.font:KFontSize(FONT_SAMLL)]

        //tabbar
        UITabBar.appearance().tintColor = KCOLOR_TAB_TEXT
        UITabBar.appearance().barTintColor =  UIColor.white
        UITabBar.appearance().isTranslucent = false
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font:KFontSize(10.0),NSAttributedStringKey.foregroundColor:UIColor.black], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font:KFontSize(10.0),NSAttributedStringKey.foregroundColor:KCOLOR_TAB_TEXT], for: .selected)
        
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

