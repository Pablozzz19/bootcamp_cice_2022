//
//  MoviesViewModel.swift
//  CiceTmdbApp
//
//  Created by cice on 23/02/2022.
//

import Foundation

// Output del Interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOuputProtocol {
    func setInfoNowPlayingViewModel(data: [ResultNowPlaying]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    // MARK: - DI
    var interactor: MoviesInteractorInputProtocol? {
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    // MARK: - Variables
    @Published var dataSourceNowPlaying: [ResultNowPlaying] = []
    
    // MARK: - Metodos publicos para la View
    func fetchData() {
        self.interactor?.fetchDataNowPlayingInteractor()
    }
}

// Output del Interactor
extension MoviesViewModel: MoviesInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [ResultNowPlaying]?) {
        self.dataSourceNowPlaying.removeAll()
        self.dataSourceNowPlaying = data ?? []
    }
}
