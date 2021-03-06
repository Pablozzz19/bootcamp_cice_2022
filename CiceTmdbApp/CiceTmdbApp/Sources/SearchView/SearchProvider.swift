/*
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation
import Combine

// Input Protocol
protocol SearchProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataSearchMovieProvider(query: String)
}

final class SearchProvider: BaseProvider {
    
    // MARK: - DI
    weak var interactor: SearchProviderOutputProtocol? {
        super.baseInteractor as? SearchProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
}

extension SearchProvider: SearchProviderInputProtocol {
    
    func fetchDataSearchMovieProvider(query: String) {
        self.networkService.requestGeneric(payloadRequest: SearchRequestDTO.requestData(query: query),
                                           entityClass: MoviesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion{
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationSearchMovies(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationSearchMovies(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
}

// MARK: - Request de apoyo
struct SearchRequestDTO {
    
    static func requestData(query: String) -> RequestDTO {
        let argument: [CVarArg] = [query]
        let urlComplete = String(format: URLEnpoint.endpointSearchMovie, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
}
