//
//  APIRegisterRequest.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 7/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper
import FAParser

class APIRegisterRequest : FAAutoCode, Mappable {
    var email: String?
    var password: String?
    var rePassWord: String?
    var clientId = "1"
    var clientSecret = "6DFUKtdNveO7oue7INvxKNc5B4VmUdVKE6Wue55f"
    
    override init() {
        super.init()
    }
    required init?(map: Map) {
        super.init()
    }
    
    init(email: String!, password: String!, rePassword: String!) {
        super.init()
        self.email = email
        self.password = password
        self.rePassWord = rePassword
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func mapping(map: Map) {
        email <- map["email"]
        password <- map["password"]
        rePassWord <- map["confirm_password"]
        clientId <- map["client_id"]
        clientSecret <- map["client_secret"]
    }
}
