//
//  AppDelegate.swift
//  MyCiceMusic
//
//  Created by cice on 08/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appCore: AppCoreCoordinatorProtocol = AppCoreCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let windowUnw = self.window {
            self.appCore.initialViewController(window: windowUnw)
        }
        return true
    }

}

