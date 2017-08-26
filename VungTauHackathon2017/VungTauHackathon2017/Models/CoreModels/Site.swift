//
//  Site.swift
//  VungTauHackathon2017
//
//  Created by Khanh Nguyen on 8/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper
import FAParser

class BaseJSonSite: NSObject, Mappable {
    
    var listSite = [Site]()
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        listSite <- map["sites"]
    }
}

class Site: FAAutoCode, Mappable {
    
    var id: String?
    var title: String?
    var siteDescription: String?
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
        title <- map["title"]
        siteDescription <- map["desc"]
        avatar <- map["img"]
        lat <- map["lat"]
        lng <- map["long"]
        
    }
    
    init(id: String?, title: String?, siteDescription: String?, avatar: String?, lat: Double, lng: Double) {
        self.id = id
        self.title = title
        self.siteDescription = siteDescription
        self.avatar = avatar
        self.lat = lat
        self.lng = lng
        super.init()
    }
    
}

