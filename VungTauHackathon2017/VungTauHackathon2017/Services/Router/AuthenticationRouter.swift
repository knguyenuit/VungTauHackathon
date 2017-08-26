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
    case createServices(APIRequestCreateServices)
    case getAllRestaurant(APIRequestGetServices)
    case getReviewByService(APIRequestGetReviewByService)
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .Login, .Logout, .Register, .createServices, .getAllRestaurant, .getReviewByService:
            return .post
            
        case .GetCurrentUser:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .Login(let apiLogin):
            return "/user/?action=\(apiLogin.action)&userName=\(apiLogin.userName!)&userPassword=\(apiLogin.userPassword!)"
        case .Logout:
            return "/api/auth/signOut"
        
        case .GetCurrentUser:
            return "/api/auth/me"
        case .Register:
            return "/api/auth/signUp"
        case .createServices(let apiCreate):
            return "/service/?action=\(apiCreate.action)&serviceName=\(apiCreate.name!)&address=\(apiCreate.address!)&serviceTypeId=\(apiCreate.serviceType)&addressLat=\(apiCreate.lat!)&addressLng=\(apiCreate.lng!)"
        case .getAllRestaurant(let apiGet):
            return "/service/?action=\(apiGet.action)&serviceTypeId=\(apiGet.serviceTypeId)"
        case .getReviewByService(let apiGet):
            return "/review/?action=\(apiGet.action)&serviceId=\(apiGet.serviceId)"

        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = URL(string: (AppConstants.baseNodeNextgenURLString as NSString).appendingPathComponent(path))!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        switch self {
        case .Login(let _): break
//            let JSONString = Mapper().toJSONString(loginRequest, prettyPrint: true)
//            let data = JSONString!.data(using: String.Encoding.utf8)
//            urlRequest.httpBody = data
        case .createServices(let _): break
        case .getAllRestaurant(let _): break
        case .getReviewByService(let _): break
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
