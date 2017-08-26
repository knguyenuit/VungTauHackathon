//
//  BoolResponse.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 8/4/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper

import Foundation
import ObjectMapper

class BoolResponse: NSObject, Mappable {
    
    public var data : Bool?
    
    override init() {
        super.init()
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }
    
}

