//
//  Restaurant.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper
import FAParser

class BaseJSonRestaurant: NSObject, Mappable {
    
    var listRestaurant = [Restaurant]()
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        listRestaurant <- map["tests"]
    }
}

class Restaurant: FAAutoCode, Mappable {
    
    var id: String?
    var restaurantName: String?
    var phoneNumber: String?
    var restaurantAddress: String?
    var avatar: String?
    
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
        id <- map["resturantID"]
        restaurantName <- map["restaurantName"]
        phoneNumber <- map["phoneNumber"]
        restaurantAddress <- map["address"]
        avatar <- map["avatar"]
        
    }
    
    init(id: String?, hotelName: String?, phoneNumber: String?, hotelAddress: String?, avatar: String) {
        self.id = id
        self.restaurantName = hotelName
        self.phoneNumber = phoneNumber
        self.avatar = avatar
        self.restaurantAddress = hotelAddress
        super.init()
    }
    
}
