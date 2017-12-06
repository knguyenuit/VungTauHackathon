//
//  Listings.swift
//  axcro
//
//  Created by Vo Quang Huy on 9/19/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper
import FAParser


class APIResponseGetMyListing: FAAutoCode, Mappable {
    var listListings = [Listings]()
    var totalEarning: Double = 0.0
    
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
        listListings <- map["listings"]
        totalEarning <- map["my_earning"]
    }
}

class Listings: FAAutoCode, Mappable {
    var id: Int = 0
    var merchantId: Int = 0
    var title: String?
    var listingsDescription: String?
    var locationName: String?
    var latitude: String?
    var longitude: String?
    var termsConditions: String?
    var noSessions : Int = 0
    var validPeriod: Int = 0
    var totalPrice: Int = 0
    var currencyUnit: String?
    var hidenDate: String?
    var status: Int = 0
    var createdAt: String?
    var updatedAt: String?
    var purchasesExists: Int?
    var isMyPurchases: Int?


    var purchasedDate: String?
    var expiredDate: String?
    var orderID: String?
    var numberPurchases : Int = 0
    var numberRedem: Int = 0
    //redemption

    var totalPurchase: Int = 0
    var totalSale: Double = 0.0
    var amountReceive: Double = 0
    var redemptionLeft: Int = 0
    
    //Payout history
    var listingPayoutID: Int = 0
    var listingTilePayout: String?
    var totalSaleAvailblePayout: Double = 0.0
    var listPaymentRequestIDPayout = [Int]()
    
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
        merchantId <- map["merchant_id"]
        title <- map["title"]
        listingsDescription <- map["description"]
        locationName <- map["location_name"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        termsConditions <- map["terms_conditions"]
        noSessions <- map["no_sessions"]
        validPeriod <- map["valid_period"]
        totalPrice <- map["total_price"]
        currencyUnit <- map["currency_unit"]
        hidenDate <- map["hiden_date"]
        status <- map["status"]
        createdAt <- map["created_at"]
        updatedAt <- map["updated_at"]
        purchasesExists <- map["purchases_exists"]
        isMyPurchases <- map["is_my_purchases"]
   

        numberPurchases <- map["number_of_purchases"]
        purchasedDate <- map["purchased_date"]
        expiredDate <- map["expired_date"]
        orderID <- map["order_id"]
        numberRedem <- map["no_redeemed"]

        totalPurchase <- map["total_purchased"]
        totalSale <- map["total_sale"]
        amountReceive <- map["amount_received"]
        redemptionLeft <- map["redemption_left"]
        
        //payout
        listingPayoutID <- map["listing_id"]
        listingTilePayout <- map["listing_title"]
        totalSaleAvailblePayout <- map["total_sale_available"]
        listPaymentRequestIDPayout <- map["payment_requested_id"]
    }
    
}

