//
//  BaseAPIResponse.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 7/18/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

public protocol APIResponseType {
    var _errors : [APIErrorType]? {get set}
    var dataAsString : String? {get set}
    
    func isError() -> Bool
}

public protocol APIResponseTypeArray {
    var _errors : [APIErrorType]? {get set}
    var dataAsString : [String?] {get set}
    
    func isError() -> Bool
}



open class BaseAPIResponse : Mappable, APIResponseType {
    
    public var _errors : [APIErrorType]?
    var errors : [BaseAPIError]? {
        get {
            return _errors as! [BaseAPIError]?
        }
        set {
            _errors = newValue
        }
    }
    public var dataAsString : String?
    
    public var paging : Pagination?
    
    required public init? (map: Map) {
        
    }
    
    open func mapping(map: Map) {
        errors          <- map["errors"]
        dataAsString    <- map["data"]
        paging          <- map["pagination"]
    }
    
    public func isError() -> Bool {
        return errors != nil && (errors?.count)! > 0
    }
}

open class BaseAPIResponseArray : Mappable, APIResponseTypeArray {
    
    public var _errors : [APIErrorType]?
    public var dataAsString : [String?] = []
    
    var errors : [BaseAPIError]? {
        get {
            return _errors as! [BaseAPIError]?
        }
        set {
            _errors = newValue
        }
    }
    
    public var paging : Pagination?
    
    required public init? (map: Map) {
        
    }
    
    open func mapping(map: Map) {
        errors          <- map["errors"]
        dataAsString    <- map["data"]
        paging          <- map["pagination"]
    }
    
    public func isError() -> Bool {
        return errors != nil && (errors?.count)! > 0
    }
}



open class APIResponse<T : Mappable> : BaseAPIResponse {
    
    var data : T?
    var result: T?
    var datas : [T]?
    
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    open override func mapping(map: Map) {
        super.mapping(map: map)
        data            <- map["data"]
        result          <- map["results"]
        datas           <- map["data"]
    }
}


open class APIResponseArray<T : Mappable> : BaseAPIResponseArray {
    
    var data : T?
    var result: [T]?
    var datas : [T]?
    
    required public init?(map: Map) {
        super.init(map: map)
    }
    
    open override func mapping(map: Map) {
        super.mapping(map: map)
        data            <- map["data"]
        result         <- map["results"]
        datas           <- map["data"]
    }
}







