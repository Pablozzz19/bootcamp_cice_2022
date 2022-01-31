//
//  AppDelegate.swift
//  MyTaskVersion3.0
//
//  Created by cice on 31/01/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appCore: AppCoreCoordinatorProtocol = AppCoreCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
        window = UIWindow(frame: UIScreen.main.bounds)
        if let windowUnw = self.window {
            self.appCore.initialViewController(window: windowUnw)
        }
                
        return true
    }
    
}

