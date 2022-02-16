//
//  SplashPresenter.swift
//  MyCiceMusic
//
//  Created by cice on 08/02/2022.
//

import Foundation

// Input del Presenter
protocol SplashPresenterInputProtocol {
    func fetchDataFromWebService()
    func showHometabBar()
}

// Output del Interactor
protocol SplashInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [MenuResponse]?)
    func setAlertMessage(error: NetworkError)
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol, SplashInteractorInputProtocol, SplashRouterInputProtocol> {
    
    var dataSourceViewModel: [MenuResponse] = []
    
}

// Input del Presenter
extension SplashPresenter: SplashPresenterInputProtocol {
    func fetchDataFromWebService() {
        self.interactor?.fetchDataFromWebServiceInteractor()
    }
    
    func showHometabBar() {
        if Utils.Constantes().kPrefer.bool(forKey: Utils.Constantes().kUsuarioLogado) {
            self.router?.showHometabBarRouter(dataSource: self.dataSourceViewModel)
        } else {
            self.router?.showLoginViewRouter(dataSource: self.dataSourceViewModel)
        }
    }
}

// Output del Interactor
extension SplashPresenter: SplashInteractorOutputProtocol{
    
    func setDataFromWebInteractor(data: [MenuResponse]?) {
        guard let dataUnw = data else { return }
        self.dataSourceViewModel.removeAll()
        self.dataSourceViewModel = dataUnw
        self.viewController?.launchAnimation()
    }
    
    func setAlertMessage(error: NetworkError) {
        self.router?.showAlert(title: "\(error.status)", message: error.status.rawValue == -1001 ? error.localizedDescription : "Aqui hay un error.")
    }
}
