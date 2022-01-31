//
//  AppCoreCoordinator.swift
//  MyUserDefault
//
//  Created by cice on 26/01/2022.
//

import UIKit

protocol AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow)
}

final class AppCoreCoordinator {
    var actualVC : UIViewController?
}

extension AppCoreCoordinator: AppCoreCoordinatorProtocol {
    func initialViewController(window: UIWindow) {
        
        self.muestraRutaUserDeafult()
        
        if (Utils.Constants().kPrefs.bool(forKey: Utils.Constants().kUserLogado)) {
            self.actualVC = HomeViewCoordinator.homeView()
        } else {
            self.actualVC = RegisterCoordinator.view()
        }
        
        window.rootViewController = self.actualVC
        window.makeKeyAndVisible()
    }
    
    private func muestraRutaUserDeafult() {
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
    }
    
}
