//
//  UserTableViewCellViewModel.swift
//  FavUsers
//
//  Created by Chanchal Raj on 09/01/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import Foundation
struct UserTableViewCellModel {
    private var user:User!
    init(user:User) {
        self.user = user
    }
    var userName:String?{
        return self.user.name?.fullName()
    }
    var userEmail:String?{
        return user.email
    }
    var thumbnailPhoto:URL?{
        if let urlString = user.picture?.thumbnail{
            return URL.init(string: urlString)
        }
        return nil
    }
    
}
