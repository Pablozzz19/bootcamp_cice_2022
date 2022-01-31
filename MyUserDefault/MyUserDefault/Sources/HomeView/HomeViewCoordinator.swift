//
//  HomeViewCoordinator.swift
//  MyUserDefault
//
//  Created by cice on 31/01/2022.
//

import UIKit

final class HomeViewCoordinator {
    
    static func homeView() -> UITabBarController {
        let homeVC = HomeViewController()
        
        let listaCochesVC = ListaCochesCoordinator.navigation()
        let listaPostVC = ListaPostsCoordinator.navigation()
        
        let iconCoches = UITabBarItem(title: "Coches",
                                      image: UIImage(systemName: "house"),
                                      selectedImage: UIImage(systemName: "house"))
        let iconPosts = UITabBarItem(title: "Post",
                                      image: UIImage(systemName: "house"),
                                      selectedImage: UIImage(systemName: "house"))
        
        listaCochesVC.tabBarItem = iconCoches
        listaPostVC.tabBarItem = iconPosts
        
        homeVC.viewControllers = [listaCochesVC, listaPostVC]
        
        return homeVC
    }
    
}
