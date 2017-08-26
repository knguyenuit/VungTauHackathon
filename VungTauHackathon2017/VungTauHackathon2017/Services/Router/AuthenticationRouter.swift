//
//  AuthenticationRouter.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 7/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

enum AuthenticationRouter: URLRequestConvertible {

    case Logout()
    case Login(APILoginRequest)

    case GetCurrentUser()
    case Register(APIRegisterRequest)

    var method: Alamofire.HTTPMethod {
        switch self {
        case .Login, .Logout, .Register:
            return .post
            
        case .GetCurrentUser:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .Login:
            return "/user?a=login"
        case .Logout:
            return "/api/auth/signOut"
        
        case .GetCurrentUser:
            return "/api/auth/me"
        case .Register:
            return "/api/auth/signUp"

        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: (AppConstants.baseNodeNextgenURLString as NSString).appendingPathComponent(path))!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        switch self {
        case .Login(let loginRequest):
            let JSONString = Mapper().toJSONString(loginRequest, prettyPrint: true)
            let data = JSONString!.data(using: String.Encoding.utf8)
            urlRequest.httpBody = data
        case .Register(let registerRequest):
            let JSONString = Mapper().toJSONString(registerRequest, prettyPrint: true)
            let data = JSONString!.data(using: String.Encoding.utf8)
            urlRequest.httpBody = data
        case .Logout():
//            urlRequest.setValue("Bearer \(Helpers.getCurrentAccessToken())", forHTTPHeaderField: "Authorization")
            urlRequest.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        case .GetCurrentUser():
            print("get")
            //let JSONString = Mapper().toJSONString(getCurrentUser, prettyPrint: true)
//            urlRequest.setValue("Bearer \(Helpers.getCurrentAccessToken())", forHTTPHeaderField: "Authorization")
//            urlRequest.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        
        }
        
        return urlRequest
    }
}
