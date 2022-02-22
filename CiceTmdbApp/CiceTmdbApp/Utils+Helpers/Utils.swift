//
//  Utils.swift
//  CiceTmdbApp
//
//  Created by cice on 22/02/2022.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    case options = "OPTIONS"
}

enum TargetEnvironment: Int {
    case DEV = 0
    case PRE = 1
    case PRO = 3
}

struct RequestDTO {
    var params: [String: AnyObject]?
    var arrayParams: [[String: AnyObject]]?
    var method: HTTPMethods
    var endpoint: String
    var urlContext: URLEnpoint.BaseUrlContext
    
    init(params: [String: AnyObject]?, method: HTTPMethods, endpoint: String, urlContext: URLEnpoint.BaseUrlContext) {
        self.params = params
        self.method = method
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
    
    init(arrayParams: [[String: AnyObject]]?, method: HTTPMethods, endpoint: String, urlContext: URLEnpoint.BaseUrlContext) {
        self.arrayParams = arrayParams
        self.method = method
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
}

struct URLEnpoint {
    
    #if DEV
    static let environmentDefault: TargetEnvironment = TargetEnvironment.DEV
    #elseif PRE
    static let environmentDefault: TargetEnvironment = TargetEnvironment.PRE
    #else
    static let environmentDefault: TargetEnvironment = TargetEnvironment.PRO
    #endif
    
    enum BaseUrlContext{
        case backend
        case webService
        case heroku
    }
    
    static let music = "%@/music/most-played/%@/songs.json"
    static let podcast = "%@/podcasts/top/%@/podcast-episodes.json"
    static let books = "%@/books/top-free/%@/books.json"
    static let apps = "%@/apps/top-free/%@/apps.json"
    
    static let menu = "iCoMenuResponse"
    static let tipsTraining = "iCoResponseConsejos"
}

extension URLEnpoint{
    static func getUrlBase(urlContext: BaseUrlContext) -> String {
        switch urlContext{
        case.backend:
            switch self.environmentDefault{
            case .DEV:
                return "https://www.azurecloud.com/api/v2/des-mgmt"
            case .PRE:
                return "https://www.azurecloud.com/api/v2/pre-devls"
            case .PRO:
                return "https://www.azurecloud.com/api/v2/pro-mrk"
            }
        case .webService:
            switch self.environmentDefault{
            case .DEV:
                return "https://rss.applemarketingtools.com/api/v2/"
            case .PRE:
                return ""
            case .PRO:
                return ""
            }
        case .heroku:
            switch self.environmentDefault{
            case .DEV:
                return "https://icospartan-app.herokuapp.com/"
            case .PRE:
                return ""
            case .PRO:
                return ""
            }
        }
    }
}
