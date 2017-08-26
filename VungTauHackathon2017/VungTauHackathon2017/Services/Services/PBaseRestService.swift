//
//  PBaseRestService.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 7/27/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import ObjectMapper
import AlamofireActivityLogger
import Alamofire
import BoltsSwift

public protocol PBaseRestService {
    //func error(code: Int, message : String) -> NSError
    
    func doRequest<T: Mappable>(request: URLRequestConvertible, showLoading: Bool) -> Task<T>
    func doRequest<T: Mappable>(request: URLRequestConvertible, showLoading: Bool) -> Task<[T]>
    
}

extension PBaseRestService {
    
    public func error(code: Int, message : String?) -> NSError {
        guard let message = message else {
            return NSError(domain: ("" as NSErrorDomain) as String, code: code, userInfo: nil)
        }
        return NSError(domain: ("" as NSErrorDomain) as String, code: code, userInfo: [NSLocalizedDescriptionKey : message])
    }
    
    public func doRequest<T : Mappable>(request: URLRequestConvertible, showLoading: Bool = true) -> Task<T>  {
        let activityData = ActivityData()
        
        let taskCompletionSource = TaskCompletionSource<T>()
        // we show loading if needed
        if showLoading == true{
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)        }
        Alamofire.request(request).responseJSON { (response) in
            
            // we hide loading indicator if needed
            if showLoading == true{
                NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            }
            switch response.result {
            case .failure(let error):
                print(error)
                taskCompletionSource.set(error: error)
            case .success(let responseObject):
                
//                if response.response?.statusCode == 200 {
//                    
//                    if let apiResponse = Mapper<APIResponse<T>>().map(JSONObject: responseObject) {
//                        if let data = apiResponse.data {
//                            taskCompletionSource.set(result: data)
//                        } else {
//                            taskCompletionSource.set(error: "error" as! Error)
//                        }
//                    } else {
//                        if let apiResponse = Mapper<T>().map(JSONObject: responseObject) {
//                                taskCompletionSource.set(result: apiResponse as! T)
//                        }
//                    }
//                    //                } else {
//                    //                    if let apiResponse = Mapper<APIError>().map(JSONObject: responseObject) {
//                    //                        if apiResponse.statusCode == 401 { //Token expired
//                    //                            NotificationCenter.default.post(name: Notification.Name(rawValue: PALogoutNotificationKey), object: nil, userInfo: nil)
//                    //                        }
//                    //                        let customError = NSError(domain: Constants.URLs.PAErrorDomain, code: apiResponse.statusCode ?? 9901, userInfo: [NSLocalizedDescriptionKey: apiResponse.message ?? "Response error"])
//                    //                        taskCompletionSource.setError(customError)
//                    //                    }
//                    //                }
//                } else if response.response?.statusCode == 401 {
//                    print(responseObject)
//                }
                if let apiResponse = Mapper<APIResponse<T>>().map(JSONObject: responseObject) {
                    if apiResponse.isError() {
                        let errorModel = (apiResponse.errors?[0])!
//                        }
                       let customError = self.error(code: errorModel.errorCode!, message: errorModel.errorMessage!)
                       
                        taskCompletionSource.set(error: customError)
                    } else {
                        if let data = apiResponse.data {
                            taskCompletionSource.set(result: data)
                        }
  
                    }
                }

            }
            
            
        }
        return taskCompletionSource.task
    }
    
    public func doRequest<T : Mappable>(request: URLRequestConvertible, showLoading: Bool = true) -> Task<[T]>  {
        let activityData = ActivityData()
        
        let taskCompletionSource = TaskCompletionSource<[T]>()
        // we show loading if needed
        if showLoading == true{
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)        }
        Alamofire.request(request).responseJSON { (response) in
            
            // we hide loading indicator if needed
            if showLoading == true{
                NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            }
            switch response.result {
            case .failure(let error):
                print(error)
                taskCompletionSource.set(error: error)
            case .success(let responseObject):
                
                    if let apiResponse = Mapper<APIResponse<T>>().map(JSONObject: responseObject) {
                        if apiResponse.isError() {
                            let errorModel = (apiResponse.errors?[0])!
                            //                        }
                            let customError = self.error(code: errorModel.errorCode!, message: errorModel.errorMessage!)
                            
                            taskCompletionSource.set(error: customError)
                        } else {
                            if let datas = apiResponse.datas {
                                taskCompletionSource.set(result: datas)
                            }
                            
                        }
                    }
                    //                } else {
                    //                    if let apiResponse = Mapper<APIError>().map(JSONObject: responseObject) {
                    //                        if apiResponse.statusCode == 401 { //Token expired
                    //                            NotificationCenter.default.post(name: Notification.Name(rawValue: PALogoutNotificationKey), object: nil, userInfo: nil)
                    //                        }
                    //                        let customError = NSError(domain: Constants.URLs.PAErrorDomain, code: apiResponse.statusCode ?? 9901, userInfo: [NSLocalizedDescriptionKey: apiResponse.message ?? "Response error"])
                    //                        taskCompletionSource.setError(customError)
                    //                    }
                    //                }
                
            }
            
            
        }
        return taskCompletionSource.task
    }
    
    public func doRequest(request: URLRequestConvertible, showLoading: Bool = true) -> Task<String>  {
        let activityData = ActivityData()
        
        let taskCompletionSource = TaskCompletionSource<String>()
        // we show loading if needed
        if showLoading == true{
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)        }
        Alamofire.request(request).responseJSON { (response) in
            
            // we hide loading indicator if needed
            if showLoading == true{
                NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            }
            switch response.result {
            case .failure(let error):
                print(error)
                taskCompletionSource.set(error: error)
            case .success(let responseObject):
                if response.response?.statusCode == 200 {
                    if let apiResponse = Mapper<TextResponse>().map(JSONObject: responseObject) {
                        if let data = apiResponse.data {
                            taskCompletionSource.set(result: data)
                        }
                    } 
                    //                } else {
                    //                    if let apiResponse = Mapper<APIError>().map(JSONObject: responseObject) {
                    //                        if apiResponse.statusCode == 401 { //Token expired
                    //                            NotificationCenter.default.post(name: Notification.Name(rawValue: PALogoutNotificationKey), object: nil, userInfo: nil)
                    //                        }
                    //                        let customError = NSError(domain: Constants.URLs.PAErrorDomain, code: apiResponse.statusCode ?? 9901, userInfo: [NSLocalizedDescriptionKey: apiResponse.message ?? "Response error"])
                    //                        taskCompletionSource.setError(customError)
                    //                    }
                    //                }
                }
            }
            
            
        }
        return taskCompletionSource.task
    }
    
    public func doRequest(request: URLRequestConvertible, showLoading: Bool = true) -> Task<Bool>  {
        let activityData = ActivityData()
        
        let taskCompletionSource = TaskCompletionSource<Bool>()
        // we show loading if needed
        if showLoading == true{
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)        }
        Alamofire.request(request).responseJSON { (response) in
            
            // we hide loading indicator if needed
            if showLoading == true{
                NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            }
            switch response.result {
            case .failure(let error):
                print(error)
                taskCompletionSource.set(error: error)
            case .success(let responseObject):
                if response.response?.statusCode == 200 {
                    if let apiResponse = Mapper<BoolResponse>().map(JSONObject: responseObject) {
                        if let data = apiResponse.data {
                            taskCompletionSource.set(result: data)
                        }
                    }
                    //                } else {
                    //                    if let apiResponse = Mapper<APIError>().map(JSONObject: responseObject) {
                    //                        if apiResponse.statusCode == 401 { //Token expired
                    //                            NotificationCenter.default.post(name: Notification.Name(rawValue: PALogoutNotificationKey), object: nil, userInfo: nil)
                    //                        }
                    //                        let customError = NSError(domain: Constants.URLs.PAErrorDomain, code: apiResponse.statusCode ?? 9901, userInfo: [NSLocalizedDescriptionKey: apiResponse.message ?? "Response error"])
                    //                        taskCompletionSource.setError(customError)
                    //                    }
                    //                }
                }
            }
            
            
        }
        return taskCompletionSource.task
    }

    public func doRequest(request: URLRequestConvertible, showLoading: Bool = true) -> Task<Any> {
        let activityData = ActivityData()
        
        let taskCompletionSource = TaskCompletionSource<Any>()
        // we show loading if needed
        if showLoading == true{
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)        }
        Alamofire.request(request).responseJSON { (response) in
            
            // we hide loading indicator if needed
            if showLoading == true{
                NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
            }
            
            switch response.result {
            case .failure(let error):
                print(error)
                taskCompletionSource.set(error: error)
            case .success(let responseObject):
                taskCompletionSource.set(result: "Success")
                
                
            }
            
            
        }
        return taskCompletionSource.task
    }

    
}
