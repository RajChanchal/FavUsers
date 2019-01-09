//
//  EndPoint.swift
//  NetworkLayer
//
//  Created by Chanchal Raj on 08/01/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

