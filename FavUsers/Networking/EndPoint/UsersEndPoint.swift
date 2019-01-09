//
//  MovieEndPoint.swift
//  NetworkLayer
//
//  Created by Chanchal Raj on 08/01/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum UsersApi {
    case users(count:Int)
}

extension UsersApi: EndPointType {
    
    var environmentBaseURL : String {
        switch APIsClient.environment {
        case .production: return "https://randomuser.me/api/"
        case .qa: return "https://randomuser.me/api/"
        case .staging: return "https://randomuser.me/api/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .users:
            return ""
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .users(let count):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: [APIConstants.APIParameterKey.results:count])
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


