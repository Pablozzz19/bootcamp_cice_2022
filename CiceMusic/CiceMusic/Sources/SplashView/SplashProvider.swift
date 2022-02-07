//
//  SplashProvider.swift
//  CiceMusic
//
//  Created by cice on 07/02/2022.
//

import Foundation

protocol SplashProviderInputProtocol {
    func fetchData(completionHadler: @escaping (Result<MusicServerModel, NetworkError>) -> Void)
}

final class SplashProvider: SplashProviderInputProtocol {
    
    let networkservice: NetworkServiceProtocol = NetworkService()
    
    func fetchData(completionHadler: @escaping (Result<MusicServerModel, NetworkError>) -> Void) {
        self.networkservice.requestGeneric(requestPayload: SplashRequestDTO.requestData(numeroItems: "10"), entityClass: MusicServerModel.self) { [weak self] (result) in
            guard self != nil else { return }
            guard let resultUnw = result else {return}
            completionHadler(.success(resultUnw))
        } failure: { (error) in
            completionHadler(.failure(error))
        }

    }
}


struct SplashRequestDTO {
    
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete)
        return request
    }
}
