//
//  APIResponseGetAllService.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation

import Foundation
import ObjectMapper

class APIResponseGetAllServices: NSObject, Mappable {
    
    public var serviceID : Int = 0
    public var serviceName: String?
    public var serviceTypeId : Int = 0
    public var address : String?
    public var addressLat: Double?
    public var addressLng: Double?
    public var reviewNum: Int = 0
    public var reviewStar: Int = 0
    public var avatar: String?
    
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        serviceID <- map["serviceID"]
        
        serviceTypeId <- map["serviceTypeID"]
        serviceName <- map["serviceName"]
        address <- map["address"]
        addressLat <- map["addressLat"]
        addressLng <- map["addressLng"]
        reviewNum <- map["reviewNum"]
        reviewStar <- map["reviewStar"]
        avatar <- map["avatar"]
        
    }
    
    
//    init(serviceID: Int?, serviceType: Int?, name: String?, address: String?, lat: Double?, lng: Double?) {
//        self.serviceID = serviceID!
//        self.serviceType = serviceType!
//        self.name = name
//        self.address = address
//        self.lat = lat
//        self.lng = lng
//    }
}

