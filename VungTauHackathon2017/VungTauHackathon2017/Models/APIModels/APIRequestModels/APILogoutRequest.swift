//
//  APILogoutRequest.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 7/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper

import Foundation
import ObjectMapper
import FAParser

class APILogoutRequest : FAAutoCode, Mappable {
 
    
    override init() {
        super.init()
    }
    required init?(map: Map) {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func mapping(map: Map) {
        
        
    }
}
