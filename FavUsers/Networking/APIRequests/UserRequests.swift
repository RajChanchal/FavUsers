//
//  UserRequests.swift
//  FavUsers
//
//  Created by Chanchal Raj on 09/01/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import Foundation
extension APIsClient{
    static func getUsers(resultCount:Int,completion:@escaping((Result<[User]>)->Void)){
        
        performRequest(endPoint: UsersApi.users(count: resultCount)) { (results:Result<UsersAPIResponse>) in
            switch results{
                    case .success(let usersAPIResponse):
                        if let users = usersAPIResponse.results{
                            completion(Result.success(value: users))
                        }else{
                            completion(Result.failure(error: CustomError.message("Users couldn't be parsed!")))
                        }
                    case .failure(let error):
                        //API-specific errors can be generated and customized here
                        completion(Result.failure(error: error))
            }
        }
    }
}
