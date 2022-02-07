//
//  SplashPresenter.swift
//  CiceMusic
//
//  Created by cice on 07/02/2022.
//

import Foundation

// Input del Presenter
protocol SplashPresenterInputProtocol {
    func fetchDataFromWebService()
}

// Output del Interactor
protocol SplashInteractorOutputProtocol {
    
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol,
                                           SplashInteractorInputProtocol,
                                           SplashRouterInputProtocol> {
    
}

// Input del Presenter
extension SplashPresenter: SplashPresenterInputProtocol {
    func fetchDataFromWebService() {
        self.interactor?.fetchDataFromWebServiceInteractor()
    }
}

// Output del Interactor
extension SplashPresenter: SplashInteractorOutputProtocol {
    
}
