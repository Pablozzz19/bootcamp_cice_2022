//
//  SplashInteractor.swift
//  CiceMusic
//
//  Created by cice on 07/02/2022.
//

import Foundation

// Input del Interactor
protocol SplashInteractorInputProtocol {
    func fetchDataFromWebServiceInteractor()
}

final class SplashInteractor: BaseInteractor<SplashInteractorOutputProtocol> {
    
}

// Input del Interactor
extension SplashInteractor: SplashInteractorInputProtocol {
    func fetchDataFromWebServiceInteractor() {
        print("Hola Mundo")
    }
}
