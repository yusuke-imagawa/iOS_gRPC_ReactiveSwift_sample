//
//  AccountApiClient.swift
//  TalkingSns
//
//  Created by imagawa on 2020/01/10.
//  Copyright © 2020 imagawa. All rights reserved.
//

import RemoteClient
import ReactiveSwift

class AccountApiClient: NSObject {
    
    static let shared = AccountApiClient()
    
    private override init() {}

    private var registerService: AccountRegisterService {
        return GrpcServiceLoader.shared.getAccountRegisterService()
    }
    
    private var service: AccountService? {
        return GrpcServiceLoader.shared.getAccountService()
    }
    
    func register(
        name: String,
        genderType: UserEntity.GenderType,
        age: Int,
        pr: String
    ) -> SignalProducer<RegisterUserResponseEntity, Error> {

        return SignalProducer<RegisterUserResponseEntity, Error> {
            (observer, lifetime) in
                
            let request = RegisterUserRequest()
            request.name = name
            request.genderType = genderType == .female ? GenderType.female : GenderType.male
            request.age = Int32(age)
            request.pr = pr
            
            self.registerService.rpcToRegister(with: request) {
                (response: RegisterUserResponse?, error: Error?) in
                
                if let error = error {
                    observer.send(error: error)
                    print(error)
                    return
                }
                
                guard let response = response else {
                    observer.send(error: NSError())
                    return
                }
                
                observer.send(value: RegisterUserResponseEntity.toEntity(
                    user: response.user,
                    apiToken: response.apiToken))
                observer.sendCompleted()
            }.startWithHeaders()
        }
    }
    
    func updateProfile(
        name: String?,
        age: Int?,
        pr: String?
    ) -> SignalProducer<Bool, Error> {
        
        return SignalProducer<Bool, Error> { (observer, lifetime) in
                
            let request = UpdateProfileRequest()
            
            if let name = name {
                let nameValue = GPBStringValue()
                nameValue.value = name
                request.name = nameValue
            }
            
            if let age = age {
                let ageValue = GPBInt32Value()
                ageValue.value = Int32(age)
                request.age = ageValue
            }
            
            if let pr = pr {
                let prValue = GPBStringValue()
                prValue.value = pr
                request.pr = prValue
            }
            
            self.service?.rpcToUpdateProfile(with: request) {
                (response: GPBEmpty?, error: Error?) in
                
                if let error = error {
                    observer.send(error: error)
                    return
                }
                
                observer.send(value: true)
                observer.sendCompleted()
            }.startWithHeaders()
        }
    }
    
    func leave() -> SignalProducer<Bool, Error> {
        
        return SignalProducer<Bool, Error> {
            (observer, lifetime) in
            
            self.service?.rpcToLeave(withRequest: GPBEmpty()) {
                (response: GPBEmpty?, error: Error?) in
                
                if let error = error {
                    observer.send(error: error)
                    return
                }
                
                observer.send(value: true)
                observer.sendCompleted()
            }.startWithHeaders()
        }
    }
}
