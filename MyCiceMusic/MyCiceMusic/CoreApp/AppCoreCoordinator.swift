//
//  AppCoreCoordinator.swift
//  MyCiceMusic
//
//  Created by cice on 08/02/2022.
//

import UIKit

protocol AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow)
    func createSlidingMenu(window: UIWindow, vc: UIViewController)
}

final class AppCoreCoordinator {
    var actualVC = UIViewController()
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow) {
        self.actualVC = SplashCoordinator.view()
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
    
    func createSlidingMenu(window: UIWindow, vc: UIViewController) {
        let frontViewController = vc
        let rearViewController = MenuCoordinator.view()
        let swRevealVC = SWRevealViewController(rearViewController: rearViewController, frontViewController: frontViewController)
        swRevealVC?.toggleAnimationType = SWRevealToggleAnimationType.easeOut
        swRevealVC?.toggleAnimationDuration = 0.30
        window.rootViewController = swRevealVC
        window.makeKeyAndVisible()
    }
}
