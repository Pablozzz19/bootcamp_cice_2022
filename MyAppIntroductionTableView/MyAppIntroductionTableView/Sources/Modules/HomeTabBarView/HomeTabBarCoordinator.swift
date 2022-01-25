//
//  HomeTabBarCoordinator.swift
//  MyAppIntroductionTableView
//
//  Created by cice on 24/01/2022.
//

import UIKit

final class HomeTabBarCoordinator {
    
    static func tabBarController() -> UITabBarController {
        let tabVC = HomeTabBarViewController()
        
        // Controladores
        let listaMeses = ListaCochesCoordinator.navigation()
        let listaCoches = ListaSuperCochesCoordinator.navigation()
        let listaPerfilRoot = ListaPerfilPostCoordinator.navigation()
        
        // Iconos.
        let listaMesesIcon = UITabBarItem(title: "Meses",
                                           image: UIImage(systemName: "house"),
                                           selectedImage: UIImage(systemName: "house.fill"))
        
        let listaCochesIcon = UITabBarItem(title: "Coches",
                                           image: UIImage(systemName: "house"),
                                           selectedImage: UIImage(systemName: "house.fill"))
        
        let listaPerfilRootIcon = UITabBarItem(title: "Feed",
                                           image: UIImage(systemName: "person"),
                                           selectedImage: UIImage(systemName: "person.fill"))
        
        // Asignar el icono al controlador.
        listaMeses.tabBarItem = listaMesesIcon
        listaCoches.tabBarItem = listaCochesIcon
        listaPerfilRoot.tabBarItem = listaPerfilRootIcon
        
        // Asignamos el array de controladores y su orden.
        tabVC.viewControllers = [listaMeses, listaCoches, listaPerfilRoot]
        return tabVC
    }
    
}
