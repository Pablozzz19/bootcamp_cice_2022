//
//  AppleViewModel.swift
//  MyCiceMusic
//
//  Created by cice on 09/02/2022.
//

import Foundation

struct AppleViewModel {
    
    let results: [GenericResult]?
    
}

struct GenericResult {
    let artistName: String?
    let id: String?
    let name: String?
    let kind: String?
    let artworkUrl100: String?
    let url: String?
    let releaseDate: String?
}
