/*
Copyright, everisSL
All rights reserved.

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

protocol ___VARIABLE_name___PresenterRouterInterface: PresenterRouterInterface {
    
}

protocol ___VARIABLE_name___PresenterInteractorInterface: PresenterInteractorInterface {
    
}

protocol ___VARIABLE_name___PresenterViewInterface: PresenterViewInterface {
   
}

final class ___VARIABLE_name___Presenter: PresenterInterface {
    
    var router: ___VARIABLE_name___RouterPresenterInterface!
    var interactor: ___VARIABLE_name___InteractorPresenterInterface!
    weak var view: ___VARIABLE_name___ViewPresenterInterface!
    
    
    
}

extension ___VARIABLE_name___Presenter: ___VARIABLE_name___PresenterRouterInterface {
    
}

extension ___VARIABLE_name___Presenter: ___VARIABLE_name___PresenterInteractorInterface {
    
}

extension ___VARIABLE_name___Presenter: ___VARIABLE_name___PresenterViewInterface {
    
    
}
