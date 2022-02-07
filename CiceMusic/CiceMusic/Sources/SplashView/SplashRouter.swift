//
//  SplashRouter.swift
//  CiceMusic
//
//  Created by cice on 07/02/2022.
//

import Foundation

// Input del Router
protocol SplashRouterInputProtocol {
    func showHomeTabBarRouter(dataSoure: [ResultMusic])
}

final class SplashRouter: BaseRouter<SplashViewController> {
    
}

// Input del RouterfetchDataFromWebService
extension SplashRouter: SplashRouterInputProtocol {
    func showHomeTabBarRouter(dataSoure: [ResultMusic]) {
        //
    }
}
