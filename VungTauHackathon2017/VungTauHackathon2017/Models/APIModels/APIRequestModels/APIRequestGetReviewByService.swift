//
//  APIRequestGetReviewByService.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper
import FAParser

class APIRequestGetReviewByService : FAAutoCode, Mappable {
    var action = "getByServiceId"
    var serviceId : Int = 0
    
    override init() {
        super.init()
    }
    required init?(map: Map) {
        super.init()
    }
    
    init(serviceId: Int) {
        super.init()
        self.serviceId = serviceId
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func mapping(map: Map) {
        action <- map["action"]
        serviceId <- map["serviceId"]
    }
}

