//
//  NetworkService.swift
//  CiceMusic
//
//  Created by cice on 07/02/2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func requestGeneric<M: Decodable>(requestPayload: RequestDTO,
                                      entityClass: M.Type,
                                      success: @escaping (M?) -> Void,
                                      failure: @escaping (NetworkError) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    func requestGeneric<M>(requestPayload: RequestDTO,
                           entityClass: M.Type,
                           success: @escaping (M?) -> Void,
                           failure: @escaping (NetworkError)) where M : Decodable {
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        let baseURL = URLEnpoint.baseUrl
        let endpoint = "\(baseURL)\(requestPayload.endpoint)"
        
        guard let urlUnw = URL(string: endpoint) else {
            failure(NetworkError(status: .unsupportedURL))
            return
        }
        
        let urlEndpoint = urlUnw
        
        session.dataTask(with: urlEndpoint) { [weak self] (data, respone, error) in
            guard self != nil else { return }
            guard let errorUnw = error {
                failure(NetworkError(error: errorUnw))
                return
            }
            guard let httpResponseUnw = respone as? HTTPURLResponse, 200..<300 ~= httpResponseUnw.statusCode else {
                failure(NetworkError(status: .badServerResponse))
            }
            guard let dataUnw = data else {
                failure(NetworkError(status: .noContent))
                return
            }
            
            do {
                let jsonObject = try JSONDecoder().decode(entityClass.self, from: dataUnw)
                DispatchQueue.main.async {
                    success(jsonObject)
                }
            } catch {
                failure(NetworkError(status: .resourceUnavailable))
            }
            
        }
        .resume()
        session.finishTasksAndInvalidate()
    }
}
