//
//  BaseRestService.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 7/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

open class BaseRestService: NSObject, PBaseRestService {
    
    public var errorDomain: String {
        return "\(type(of:self)).errorDomain"
    }
    
   
//    var apiUser: U {
//        get {
//            return Helpers.getAssemblerResolver().resolve(PAuthenticationService.self)?.getCurrentUser() ?? APILoginUserInfo()
//        }
//    }
//    
//    func makeRequest<T : Mappable>(request: URLRequestConvertible, returnType: T.Type, isArrayResponse: Bool, showLoading: Bool = true) -> MyRequest {
//        return self.doRequest(request: request, returnType: returnType, isArrayResponse: isArrayResponse,showLoading: showLoading)
//    }
}


