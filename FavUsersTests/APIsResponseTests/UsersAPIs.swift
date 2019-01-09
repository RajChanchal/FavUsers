
//
//  UsersAPIs.swift
//  FavUsersTests
//
//  Created by Chanchal Raj on 09/01/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import XCTest
@testable import FavUsers
class UsersAPIs: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    //MARK:- Test User Object Mapping
    func testUsersJSONMapping() throws{
        let bundle = Bundle.init(for: type(of: self))
        if let url = bundle.url(forResource: "User", withExtension: "json"){
            let json = try Data.init(contentsOf: url)
            do{
                let decoder = JSONDecoder()
                let user:User = try decoder.decode(User.self, from: json)
                XCTAssertEqual(user.name?.first, "louella")
                XCTAssertEqual(user.email, "louella.johnson@example.com")
                
            }catch let jsonConverstionError{
                XCTFail("Couldn't convert JSON: \(jsonConverstionError.localizedDescription)")
            }
            
        }else{
            XCTFail("User.json file is missing")
            return
        }
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
