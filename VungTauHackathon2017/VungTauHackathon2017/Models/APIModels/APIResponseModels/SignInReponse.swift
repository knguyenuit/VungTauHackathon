//
//  SignInReponse.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 7/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation

import Foundation
import ObjectMapper

class SignInReponse: NSObject, Mappable {
    
    public var refreshToken : String?
    public var accessToken: String?
    public var tokenType : String?
    public var expiresIn: Float?
    
    override init() {
        super.init()
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        tokenType <- map["token_type"]
        expiresIn <- map["expires_in"]
        accessToken <- map["access_token"]
        refreshToken <- map["refresh_token"]
        
    }
    
    
    init(tokenType: String?, expires_in: Float?, access_token: String?, refresh_token: String?) {
        self.tokenType = tokenType
        self.expiresIn = expires_in
        self.accessToken = access_token
        self.refreshToken = refresh_token
    }
}
