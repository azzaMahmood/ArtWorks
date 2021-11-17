//
//  ArtWorkService.swift
//  ArtWorks
//
//  Created by Azza on 17/11/2021.
//

import Foundation
import Moya

enum ArtWorkService: TargetType {
    
    case artworks(page: Int)
    case artist(artestId: Int)
    
    var baseURL: URL {
        return URL (string: "https://api.artic.edu/api/v1/")!
    }
    
    var path: String {
        switch  self {
        case .artworks:
            return "artworks"
        case .artist(let requestId):
            return "artists/\(requestId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .artworks:
            return .get
        case .artist:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        
        case .artworks(let page):
            return Task.requestParameters(parameters: ["page": page], encoding: URLEncoding.default)
            
        case .artist:
            return Task.requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

