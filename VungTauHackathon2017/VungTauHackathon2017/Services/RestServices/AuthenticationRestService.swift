//
//  UserInteractiveServices.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 7/25/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
import ObjectMapper
import AlamofireActivityLogger
import Alamofire
import BoltsSwift

class AuthenticationRestService : PAuthenticationService, PBaseRestService {
    
    var cacheProvider: PCacheProvider?
    var baseRestService: PBaseRestService?
    var currentUser: User?
    var currentAccessToken: String?
    
    init(cacheProvider: PCacheProvider?, baseRestService: PBaseRestService?) {
        self.cacheProvider = cacheProvider
        self.baseRestService = baseRestService
    }
    
    func register(_ registerRequest: APIRegisterRequest!, showLoading: Bool = true) -> Task<User> {
        return doRequest(request: AuthenticationRouter.Register(registerRequest), showLoading: true)
    }
    
    func createService(_ createRequest: APIRequestCreateServices!, showLoading: Bool = true) -> Task<APIResponseCreateServices> {
        
    return doRequest(request: AuthenticationRouter.createServices(createRequest), showLoading: true)
    }
    
    func getAllRestaurant(_ serviceType: APIRequestGetServices) -> Task<[APIResponseGetAllServices]> {
        return doRequest(request: AuthenticationRouter.getAllRestaurant(serviceType), showLoading: true)
    }
    
    func login(_ loginRequest: APILoginRequest!, showLoading: Bool = true) -> Task<User> {
        return doRequest(request: AuthenticationRouter.Login(loginRequest), showLoading: true)
    }
    
    
    func getCurrentUserBeforeLogin() -> Task<User> {
        return doRequest(request: AuthenticationRouter.GetCurrentUser())
    }
    
    func logout() -> Task<String> {
        return doRequest(request: AuthenticationRouter.Logout(), showLoading: true)
    }
    
    //Save current user
    func saveCurrentUser(user: User) {
        currentUser = user
        cacheProvider?.saveCurrentUser(user: user)
    }
    
    func getCurrentUser() -> User? {
        if let currentUser = self.currentUser {
            return currentUser
        }
        
        if let user = cacheProvider?.getCurrentUser() {
            self.currentUser = user
            return user
        }
        return nil
    }
    
    func getCurrentAccessToken() -> String {
        return (getCurrentUser()?.accessToken!)!
    }
    
    func saveCurrentAccessToken(accessToken: String?) {
        self.currentAccessToken = accessToken
    }
    
    func deleteCurrentUser() {
        self.currentUser = nil
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: AppConstants.userCredentialKey) != nil {
            userDefaults.removeObject(forKey: AppConstants.userCredentialKey)
        }

    }
    
    
}
