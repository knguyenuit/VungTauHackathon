//
//  APIRequestGetRestaurant.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation

import Foundation
import ObjectMapper

class APIRequestGetServices: NSObject, Mappable {
    
    public var action = "get"
    public var serviceTypeId : Int = 0
   
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        serviceTypeId <- map["serviceTypeId"]
        action <- map["action"]
        
    }
    
    
    init(serviceTypeId: Int?) {
        self.serviceTypeId = serviceTypeId!
    }
}

