//
//  ApplicationAssembly.swift
//  Kiddi
//
//  Created by Khanh Nguyen on 7/26/17.
//  Copyright © 2017 Khanh Nguyen. All rights reserved.
//

import Swinject

class ApplicationAssembly : Assembly {
    
    func loaded(resolver: Resolver) {
        print("ALL SERVICE ASSEMBLIES LOADED 😊")
    }
    
    func assemble(container: Container) {
        
        container.register(PAuthenticationService.self, factory: { resolver in
            AuthenticationRestService(cacheProvider: resolver.resolve(PCacheProvider.self), baseRestService: resolver.resolve(PBaseRestService.self))
        }).inObjectScope(.container)
        
//        container.register(PNotificationService.self, factory: { resolver in
//            NotificationRestService(baseRestService: resolver.resolve(PBaseRestService.self))
//        }).inObjectScope(.container)
//        
//        container.register(PCacheProvider.self, factory: { resolver in
//            CacheProvider()
//        }).inObjectScope(.container)
//        
//        container.register(PBaseRestService.self, factory: { resolver in
//            BaseRestService()
//        }).inObjectScope(.container)
//        
//        container.register(PAuthenticationService.self, factory: { resolver in
//            AuthenticationRestService(cacheProvider: resolver.resolve(PCacheProvider.self), baseRestService: resolver.resolve(PBaseRestService.self))
//        }).inObjectScope(.container)
//        
//        container.register(PKidServices.self, factory: { resolver in
//            KidRestService(cacheProvider: resolver.resolve(PCacheProvider.self), baseRestService: resolver.resolve(PBaseRestService.self))
//        }).inObjectScope(.container)
//        
//        container.register(PShowAlertProvider.self, factory: { resolver in
//            ShowAlertProvider()
//        }).inObjectScope(.container)
//        
//        container.register(PQuizQuestionService.self, factory: { resolver in
//            QuizQuestionRestService()
//        }).inObjectScope(.container)
//        
//        container.register(PS3ImageManager.self, factory: { resolver in
//            S3ImageManager()
//        }).inObjectScope(.container)

    }
    
}

class ApplicationAssembler {
    
    public static let sharedInstance = ApplicationAssembler()
    let resolver : Resolver =  {
        return Assembler([ApplicationAssembly()]).resolver
    }()
}

