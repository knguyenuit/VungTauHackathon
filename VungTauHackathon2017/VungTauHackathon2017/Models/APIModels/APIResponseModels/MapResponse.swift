//
//  MapResponse.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper

class MapReponse: NSObject, Mappable {
    
    public var geometry : Geometry?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        geometry <- map["geometry"]
        
    }
    
}

class Geometry: NSObject, Mappable {
    
    public var location : Location?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        location <- map["location"]
        
    }
    
}

class Location: NSObject, Mappable {
    
    public var lng : Double?
    public var lat: Double?
    
    init(lat: Double, lng: Double) {
        self.lat = lat
        self.lng = lng
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        lat <- map["lat"]
        lng <- map["lng"]
        
    }
    
}
