//
//  Result.swift
//  FavUsers
//
//  Created by Chanchal Raj on 09/01/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import Foundation
enum Result<Value>{
    case success(value:Value)
    case failure(error:Error)
}
enum CustomError:Error{
    case message(String)
}
extension CustomError:LocalizedError{
    public var errorDescription: String? {
        switch self {
        case .message(let message):
            return message
        }
    }
}
