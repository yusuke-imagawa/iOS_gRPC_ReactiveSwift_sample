//
//  UserApiService.swift
//  TalkingSns
//
//  Created by imagawa on 2020/02/14.
//  Copyright © 2020 imagawa. All rights reserved.
//

import ReactiveSwift

class UserApiService {
    
    static let shared = UserApiService()
    
    private init() {}
    
    private var userService: UserService? {
        return GrpcServiceLoader.shared.getUserService()
    }

    func getUsers(
        limit: Int,
        maxOnlineDatetime: Date?
    ) -> SignalProducer<[UserEntity], Error> {

        return SignalProducer<[UserEntity], Error> {
            (observer, lifetime) in
                
            let request = GetUsersRequest()
            request.limit = Int32(limit)
            
            if let maxOnlineDatetime = maxOnlineDatetime {
                request.maxOnlineDatetime = GPBTimestamp(date: maxOnlineDatetime)
            }
            
            self.userService?.rpcToGetUsers(with: request, handler: {
                (response: GetUsersResponse?, error: Error?) in
                
                if let error = error {
                    observer.send(error: error)
                    return
                }
                
                guard let response = response else {
                    observer.send(error: NSError())
                    return
                }
                
                var userEntities = [UserEntity]()
                for user in response.usersArray {
                    guard let user = user as? User else {
                        continue
                    }
                    userEntities.append(UserEntity.toEntity(user: user))
                }
                
                observer.send(value: userEntities)
                observer.sendCompleted()
            }).startWithHeaders()
        }
    }
    
    func getUser(
        userId: Int
    ) -> SignalProducer<UserEntity, Error> {

        return SignalProducer<UserEntity, Error> {
            (observer, lifetime) in
                
            let request = GetUserRequest()
            request.userId = Int32(userId)
            
            self.userService?.rpcToGetUserById(
                with: request,
                handler: { (response: GetUserResponse?, error: Error?) in
                
                if let error = error {
                    observer.send(error: error)
                    return
                }
                
                guard let response = response else {
                    observer.send(error: NSError())
                    return
                }
                
                observer.send(value: UserEntity.toEntity(user: response.user))
                observer.sendCompleted()
            }).startWithHeaders()
        }
    }
}
