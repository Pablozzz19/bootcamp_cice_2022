//
//  RegisterCoordinator.swift
//  MyUserDefault
//
//  Created by cice on 26/01/2022.
//

import UIKit

final class RegisterCoordinator {
    
    // Wildcard - Comodin
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = RegisterViewController()
        return vc
    }
    
}
