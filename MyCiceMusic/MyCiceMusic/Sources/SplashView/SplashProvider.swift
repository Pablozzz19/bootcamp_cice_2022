//
//  SplashProvider.swift
//  MyCiceMusic
//
//  Created by cice on 08/02/2022.
//

import Foundation

protocol SplashProviderInputProtocol {
    func fetchData(completioHadler: @escaping (Result<AppleServerModel, NetworkError>) -> Void)
}

final class SplashProvider: SplashProviderInputProtocol {
    
    let networkservice: NetworkServiceProtocol = NetworkService()
    
    func fetchData(completioHadler: @escaping (Result<AppleServerModel, NetworkError>) -> Void) {
        self.networkservice.requestGeneric(requestPayload: SplashRequestDTO.requestData(numeroItems: "10"),
                                           entityClass: AppleServerModel.self) { [weak self] (result) in
            guard self != nil else { return }
            guard let resultUnw = result else { return }
            completioHadler(.success(resultUnw))
        } failure: { (error) in
            completioHadler(.failure(error))
        }
    }
}


struct SplashRequestDTO {
    
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [NSLocale.current.languageCode ?? "us", numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
}
