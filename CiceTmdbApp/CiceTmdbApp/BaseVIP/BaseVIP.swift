//
//  BaseVIP.swift
//  CiceTmdbApp
//
//  Created by cice on 22/02/2022.
//

import Foundation

enum ViewModelState: String {
    case ok
    case loading
    case error
}

protocol BaseInteractorInputProtocol: AnyObject {}
protocol BaseInteractorOuputProtocol: AnyObject {}
protocol BaseProviderInputProtocol: AnyObject {}
protocol BaseProviderOuputProtocol: AnyObject {}

class BaseViewModel {
    
    @Published var state: ViewModelState = .ok
    
    func changeState() {
        let option = Int.random(in: 0..<3)
        switch option {
        case 0: self.state = .ok
        case 1: self.state = .loading
        case 2: self.state = .error
        default: self.state = .ok
        }
    }
    
    internal var baseInteractor: BaseInteractorInputProtocol?
    required init(){}
    
}

class BaseInteractor {
    internal weak var baseViewModel: BaseInteractorOuputProtocol?
    internal var baseProvider: BaseProviderInputProtocol?
    required init(){}
}

class BaseProvider {
    internal weak var baseInteractor: BaseProviderOuputProtocol?
    required init(){}
}

class BaseCoordinator {
    static func coordinator<ViewModel: BaseViewModel,
                            Interactor: BaseInteractor,
                            Provider: BaseProvider>(viewModel: ViewModel.Type,
                                                    interactor: Interactor.Type, provider: Provider.Type) -> (viewModel: ViewModel,
                                                                                                              interactor: Interactor,
                                                                                                              provider: Provider) {
        let baseViewModel = ViewModel()
        let baseInteractor = Interactor()
        let baseProvider = Provider()
        
        baseViewModel.baseInteractor = baseInteractor as? BaseInteractorInputProtocol
        baseInteractor.baseViewModel = baseViewModel as? BaseInteractorOuputProtocol
        baseInteractor.baseProvider = baseProvider as? BaseProviderInputProtocol
        baseProvider.baseInteractor = baseInteractor as? BaseProviderOuputProtocol
        
        return (baseViewModel, baseInteractor, baseProvider)
    }
}
