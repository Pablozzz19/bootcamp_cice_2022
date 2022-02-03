//
//  CategoriaViewCoordinator.swift
//  MyTaskVersion3.0
//
//  Created by cice on 03/02/2022.
//

import UIKit

final class CategoriasViewCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view(delegate: CategoriasViewControllerDelegate? = nil) -> UIViewController {
        let vc = CategoriasViewController()
        vc.delegate = delegate
        return vc
    }
}
