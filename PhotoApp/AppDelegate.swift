//
//  AppDelegate.swift
//  PhotoApp
//
//  Created by Maksim Malofeev on 13/06/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light

        return true
    }


}

