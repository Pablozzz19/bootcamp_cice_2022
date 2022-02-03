//
//  DetalleContactoCoordinator.swift
//  MyTaskVersion3.0
//
//  Created by cice on 31/01/2022.
//

import UIKit

final class DetalleContactoViewCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view(dto: DetalleContactoCoordinatorDTO? = nil) -> UIViewController {
        let vc = DetalleContactoViewController()
        vc.dataModel = dto?.model
        return vc
    }
}

struct DetalleContactoCoordinatorDTO {
    var model: ArrayContact?
}
