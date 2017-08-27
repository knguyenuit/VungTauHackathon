//
//  APIRequestGetServiceByOwner.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper
import FAParser

class APIRequestGetServiceByOwner : FAAutoCode, Mappable {
    var action = "getByOwnerId"
    var ownerId : Int = 0
    
    override init() {
        super.init()
    }
    required init?(map: Map) {
        super.init()
    }
    
    init(ownerId: Int) {
        super.init()
        self.ownerId = ownerId
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func mapping(map: Map) {
        action <- map["action"]
        ownerId <- map["ownerId"]
    }
}

