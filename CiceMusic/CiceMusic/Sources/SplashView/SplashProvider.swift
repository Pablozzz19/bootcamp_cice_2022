//
//  SplashProvider.swift
//  CiceMusic
//
//  Created by cice on 07/02/2022.
//

import Foundation

protocol SplashProviderInputProtocol {
    func fetchData()
}

final class SplashProvider: SplashProviderInputProtocol {
    
    let networkservice: NetworkServiceProtocol = NetworkService()
    
    func fetchData() {
        self.networkservice.requestGeneric(requestPayload: SplashRequestDTO.requestData(numeroItems: "10"),
                                           entityClass: MusicServerModel.self,
                                           success: { (result) in },
                                           failure: { (error) in })
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
