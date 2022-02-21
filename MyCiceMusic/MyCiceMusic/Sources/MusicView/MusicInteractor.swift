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

// Input del Interactor
protocol MusicInteractorInputProtocol {
    func transformDataFromInteractor()
}

final class MusicInteractor: BaseInteractor<MusicInteractorOutputProtocol> {
    
    // ID
    let provider: MusicProviderInputProtocol = MusicProvider()
    
    // MARK: - Variables globales
    var data: MusicCoordinatorDTO?
    
    func transformDataFromAppleServerModelToArrayGenericResult(data: AppleServerModel) -> [GenericResult] {
        var arrayGenericResult: [GenericResult] = []
        if let dataUnw = data.feed?.results {
            for item in dataUnw {
                
                let objc = GenericResult(artistName: item.artistName,
                                        id: item.artistId,
                                        name: item.name,
                                        kind: item.kind,
                                        artworkUrl100: item.artworkUrl100,
                                        url: item.url,
                                        releaseDate: item.releaseDate)
                arrayGenericResult.append(objc)
            }
        }
        return arrayGenericResult
    }
    
}

// Input del Interactor
extension MusicInteractor: MusicInteractorInputProtocol {
    
    func transformDataFromInteractor() {
        self.provider.fetchData { (result) in
            switch result {
            case .success(let modelData):
                self.presenter?.dataTransformedFromInteractor(data: self.transformDataFromAppleServerModelToArrayGenericResult(data: modelData))
            case .failure(let error):
                debugPrint(error)
                //self.presenter?.setAlertMessage(error: error)
            }
        }
    }
}
