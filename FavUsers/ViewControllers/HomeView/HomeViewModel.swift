//
//  HomeViewModel.swift
//  FavUsers
//
//  Created by Chanchal Raj on 08/01/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import Foundation


class HomeViewModel{
    
    private var users:[User]?
    
    func getUsers(completion:@escaping(Result<Bool>)->Void){
        APIsClient.getUsers(resultCount: 3) { (result) in
            switch result{
                case .success(let users):
                    self.users = users
                    completion(.success(value: true))
                case .failure(let error):
                    completion(.failure(error: error))
            }
        }
    }
    
    var totalUsers:Int{
        return users?.count ?? 0
    }
    
    func userCellViewModelForIndex(index:Int) -> UserTableViewCellModel?{
        if let users = users, let user = users[safe:index]{
            return UserTableViewCellModel.init(user: user)
        }
        return nil
    }
}
