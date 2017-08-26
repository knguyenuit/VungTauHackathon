//
//  APILoginRequest.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 7/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper
import FAParser

class APILoginRequest : FAAutoCode, Mappable {
    
    var userName: String?
    var userPassword: String?
    
    

    override init() {
        super.init()
    }
    required init?(map: Map) {
        super.init()
    }
    
    init(email: String!, passWord: String!) {
        super.init()
        self.userName = email
        self.userPassword = passWord
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func mapping(map: Map) {
        userName <- map["userName"]
        userPassword <- map["userPassword"]
    }
}
