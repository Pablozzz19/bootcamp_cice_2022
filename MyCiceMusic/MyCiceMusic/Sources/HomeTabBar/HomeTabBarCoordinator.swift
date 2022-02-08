//
//  HomeTabBarCoordinator.swift
//  MyCiceMusic
//
//  Created by cice on 08/02/2022.
//

import Foundation
import UIKit

final class HomeTabBarCoordinator {
    
    static func tabBarController(dto: HomeTabBarCoordinatorDTO? = nil) -> UITabBarController {
        let tbc = HomeTabBarViewController()
        
        // Controllers
        let musicVC = MusicCoordinator.navigation(dto: MusicCoordinatorDTO(model: dto?.data))
        let podacastVC = PodcastCoordinator.navigation()
        let booksVC = BooksCoordinator.navigation()
        
        // Icons
        let iconMusic = UITabBarItem(title: "Music",
                                     image: UIImage(systemName: "music.note.list"),
                                     selectedImage: UIImage(systemName: "music.note.list"))
        let iconPodcast = UITabBarItem(title: "Podcast",
                                     image: UIImage(systemName: "music.note.house.fill"),
                                     selectedImage: UIImage(systemName: "music.note.house.fill"))
        let iconBooks = UITabBarItem(title: "Books",
                                     image: UIImage(systemName: "book"),
                                     selectedImage: UIImage(systemName: "book"))
        
        // Asignamos el icono al controlador
        musicVC.tabBarItem = iconMusic
        podacastVC.tabBarItem = iconPodcast
        booksVC.tabBarItem = iconBooks
        
        tbc.viewControllers = [musicVC, podacastVC, booksVC]
        
        return tbc
    }
    
}

struct HomeTabBarCoordinatorDTO {
    var data: [ResultMusic]?
}
