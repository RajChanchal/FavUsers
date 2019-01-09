//
//  APIsClient.swift
//  FavUsers
//
//  Created by Chanchal Raj on 09/01/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import Foundation
class APIsClient {
    static let environment : NetworkEnvironment = .production
    
    static func performRequest<T:Decodable>(endPoint:UsersApi, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T>)->Void){
        let router = Router<UsersApi>()
        router.request(endPoint) { (data, response, error) in
            if let error = error{
                completion(Result.failure(error: error))
            }else if let data = data{
                do{
                    let apiResponse = try decoder.decode(T.self, from: data)
                    completion(Result.success(value: apiResponse))
                } catch let jsonConverstionError{
                    completion(Result.failure(error: jsonConverstionError))
                }
                
            }else{
                //no data returned
                completion(Result.failure(error: CustomError.message("No data was returned!")))
            }
        }
        
    }
}
