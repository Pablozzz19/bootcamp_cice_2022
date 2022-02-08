//
//  SplashRouter.swift
//  MyCiceMusic
//
//  Created by cice on 08/02/2022.
//

import Foundation

// Input del Router
protocol SplashRouterInputProtocol {
    func showHometabBarRouter(dataSource: [ResultMusic])
}

final class SplashRouter: BaseRouter<SplashViewController>{
    
}

// Input del Router
extension SplashRouter: SplashRouterInputProtocol {
    func showHometabBarRouter(dataSource: [ResultMusic]) {
        debugPrint(dataSource)
    }
}
