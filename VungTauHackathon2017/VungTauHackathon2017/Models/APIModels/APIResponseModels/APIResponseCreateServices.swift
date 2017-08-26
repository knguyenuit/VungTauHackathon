

//
//  APIResponseCreateService.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation

import Foundation
import ObjectMapper

class APIResponseCreateServices: NSObject, Mappable {
    
    public var serviceID : Int = 0
    public var action = "create"
    public var serviceType : Int = 0
    public var name: String?
    public var address : String?
    public var lat: Double?
    public var lng: Double?
    
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        serviceID <- map["serviceID"]
        action <- map["action"]
        serviceType <- map["serviceTypeID"]
        name <- map["serviceName"]
        address <- map["address"]
        lat <- map["addressLat"]
        lng <- map["addressLng"]
        
    }
    
    
    init(serviceID: Int?, serviceType: Int?, name: String?, address: String?, lat: Double?, lng: Double?) {
        self.serviceID = serviceID!
        self.serviceType = serviceType!
        self.name = name
        self.address = address
        self.lat = lat
        self.lng = lng
    }
}

