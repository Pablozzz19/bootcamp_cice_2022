//
//  AppDelegate.swift
//  MyAppIntroductionTableView
//
//  Created by cice on 24/01/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appCoordinator: AppCoordinatorProtocol = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        if let windowUnw = self.window {
            appCoordinator.setPrincipalViewController(window: windowUnw)
        }
        return true
    }
}

