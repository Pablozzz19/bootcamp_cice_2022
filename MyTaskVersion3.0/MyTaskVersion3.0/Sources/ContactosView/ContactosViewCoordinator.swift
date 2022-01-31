//
//  ContactosViewCoordinator.swift
//  MyTaskVersion3.0
//
//  Created by cice on 31/01/2022.
//

import UIKit

final class ContactosViewCordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController {
        let vc = ContactosViewController()
        return vc
    }
}
