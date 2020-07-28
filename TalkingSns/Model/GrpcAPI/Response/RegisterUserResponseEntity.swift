//
//  RegisterUserResponseEntity.swift
//  TalkingSns
//
//  Created by imagawa on 2020/02/04.
//  Copyright © 2020 imagawa. All rights reserved.
//

struct RegisterUserResponseEntity {
    let user: UserEntity
    let apiToken: String
    
    static func toEntity(user: User, apiToken: String) -> RegisterUserResponseEntity {
        let userEntity = UserEntity.toEntity(user: user)
        return RegisterUserResponseEntity(user: userEntity, apiToken: apiToken)
    }
}
