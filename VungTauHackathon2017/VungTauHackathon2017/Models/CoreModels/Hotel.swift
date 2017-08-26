//
//  Hotel.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper
import FAParser

class BaseJSonHotel: NSObject, Mappable {
    
    var listHotel = [Hotel]()
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        listHotel <- map["hotel"]
    }
}

class Hotel: FAAutoCode, Mappable {
    
    var id: Int = 0
    var hotelName: String?
    var phoneNumber: String?
    var hotelAddress: String?
    var avatar: String?
    var lat = 0.0
    var lng = 0.0
    
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
        id <- map["id"]
        hotelName <- map["name"]
        phoneNumber <- map["phone"]
        hotelAddress <- map["address"]
        avatar <- map["avatar"]
        lat <- map["lat"]
        lng <- map["long"]
        
    }
    
    init(id: Int?, hotelName: String?, phoneNumber: String?, hotelAddress: String?, avatar: String, lat: Double, lng: Double) {
        self.id = id!
        self.hotelName = hotelName
        self.phoneNumber = phoneNumber
        self.avatar = avatar
        self.hotelAddress = hotelAddress
        self.lat = lat
        self.lng = lng
        super.init()
    }
    
}

