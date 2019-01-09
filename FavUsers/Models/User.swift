//
//  User.swift
//  FavUsers
//
//  Created by Chanchal Raj on 08/01/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import UIKit

struct User:Decodable {
    var name:Name?
    var email:String?
    var picture:Picture?
    
}
struct Name:Decodable{
    var title:String?
    var first:String?
    var last:String?
    func fullName() -> String{
        var firstName = (self.first ?? "").capitalized
        let lastName = (self.last ?? "").capitalized
        firstName = firstName == "" ? firstName : (firstName + " ")
        return firstName + lastName
    }
}
struct Picture:Decodable{
    var large:String?
    var medium:String?
    var thumbnail:String?
}
