//
//  ReviewService.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper
import FAParser

class ReviewService: FAAutoCode, Mappable {
    
    var id: String?
    var userName: String?
    var starForService: Int? = 0
    var reviewStar: Int? = 0
    var reviewContent: String?
    public var reviewNum : Int? = 0
    
    
    
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
        //id <- map["userID"]
        userName <- map["userName"]
        starForService <- map["starForService"]
        reviewStar <- map["reviewStar"]
        reviewContent <- map["reviewContent"]
        reviewNum <- map["reviewNum"]
        //        accessToken <- map["access_token"]
        //        refreshToken <- map["refresh_token"]
        
    }
    
    //    init(id: String?, email: String?) {
    //        self.id = id
    //        //self.email = email
    //        super.init()
    //    }
    
//    init(id: String?, email: String?, userName: String?, phoneNumber: String?, avatar: String, access_token: String?, refresh_token: String?) {
//        self.id = id
//        //self.email = email
//        self.userName = userName
//        self.phoneNumber = phoneNumber
//        self.avatar = avatar
//        self.accessToken = access_token
//        self.refreshToken = refresh_token
//        super.init()
//    }
    
}

