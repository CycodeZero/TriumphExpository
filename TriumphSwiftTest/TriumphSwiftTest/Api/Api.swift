//
//  Api.swift
//  TriumphSwiftTest
//
//  Created by Jared Geller on 8/25/21.
//

import Foundation

class Api {
    static var User = UsersApi()
    static var Donations = DonationsApi()
    static var Organization = OrganizationApi()
    
    let postData = "username=Steve&password=123456".data(using: .utf8)  // Sensitive
        //...
    var request = URLRequest(url: url)
    request.HTTPBody = postData
}
