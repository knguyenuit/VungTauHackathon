//
//  PAuthenticationService.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 7/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Foundation

import BoltsSwift

protocol PAuthenticationService {
    
    ///Register
    func register(_ registerRequest: APIRegisterRequest!, showLoading: Bool) -> Task<User>
    
//    ///Register facebook
//    func registerWithFacebook(_ registerRequest: APIRegisterWithFacebook!, showLoading: Bool) -> Task<User>
//    
//    ///Login facebook
//    func loginWithFacebook(_ loginRequest: APIRegisterWithFacebook!, showLoading: Bool) -> Task<SignInReponse>
    
    ///Login
    func login(_ loginRequest: APILoginRequest!, showLoading: Bool) -> Task<User>
    
    func createService(_ createRequest: APIRequestCreateServices!, showLoading: Bool) -> Task<APIResponseCreateServices>
    ///Logout
    func logout() -> Task<String>
    
    func getAllRestaurant(_ serviceType: APIRequestGetServices) -> Task<[APIResponseGetAllServices]>
    
    func getAllReviewByService(_ service: APIRequestGetReviewByService) -> Task<[ReviewService]>

    ///Change password
    //func changePassword(_ changePasswordRequest: APIChangePasswordRequest!, showLoading: Bool) -> Task<User>
    
    
    ///Save current user
    func saveCurrentUser(user: User)
    
    ///Get current user
    func getCurrentUser() -> User?
    
    ///Get current access token
    func getCurrentAccessToken() -> String
    
    ///Save current access token
    func saveCurrentAccessToken(accessToken: String?)
    
    ///Get current user before login
    func getCurrentUserBeforeLogin() -> Task<User>
    
    ///Delete current user
    func deleteCurrentUser()
    
//    ///Update user profile
//    func updateUserProfile(_ updateProfileRequest: APIRequestUpdateUserProfile, showLoading: Bool) -> Task<User>
//    
//    ///Reset Password
//    func resetPasswordRequest(_ requestResetPassword: APIRequestResetPassword, showLoading: Bool) -> Task<String>
//    
//    func processResetPassword(_ processResetPassword: APIProcessResetPassword, showLoading: Bool) -> Task<Bool>
}
