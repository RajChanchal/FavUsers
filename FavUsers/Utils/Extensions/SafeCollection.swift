//
//  SafeCollection.swift
//  FavUsers
//
//  Created by Chanchal Raj on 09/01/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import Foundation
extension Collection{
    subscript(safe index:Index)->Element?{
        return indices.contains(index) ? self[index] : nil
    }
}
