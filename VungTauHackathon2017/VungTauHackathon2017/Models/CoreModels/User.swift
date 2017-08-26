//
//  User.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 7/24/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper
import FAParser

class User: FAAutoCode, Mappable {
    
    var id: String?
    var userName: String?
    var passWord: String?
    var phoneNumber: String?
    var avatar: String?
    public var refreshToken : String?
    public var accessToken: String?
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init() {
        super.init()
    }
    required init?(map: Map) {
        super.init()
    }
    
    func mapping(map: Map) {
        id <- map["userID"]
        userName <- map["userName"]
        passWord <- map["userPassword"]
        phoneNumber <- map["userPhone"]
//        accessToken <- map["access_token"]
//        refreshToken <- map["refresh_token"]
        
    }
    
//    init(id: String?, email: String?) {
//        self.id = id
//        //self.email = email
//        super.init()
//    }
    
    init(id: String?, email: String?, userName: String?, phoneNumber: String?, avatar: String, access_token: String?, refresh_token: String?) {
        self.id = id
        //self.email = email
        self.userName = userName
        self.phoneNumber = phoneNumber
        self.avatar = avatar
        self.accessToken = access_token
        self.refreshToken = refresh_token
        super.init()
    }

}
