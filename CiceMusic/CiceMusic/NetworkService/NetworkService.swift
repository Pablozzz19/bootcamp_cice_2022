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
    
}
