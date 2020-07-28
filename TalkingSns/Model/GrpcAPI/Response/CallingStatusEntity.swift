//
//  CallingStatusEntity.swift
//  TalkingSns
//
//  Created by imagawa on 2020/02/03.
//  Copyright © 2020 imagawa. All rights reserved.
//struct

struct CallingStatusEntity {

    enum CallingStatus: Int {
        case starting = 0
        case talking = 1
        case end = 2
    }

    let fromUserId: Int
    let toUserId: Int
    let status: CallingStatus?

    init(fromUserId: Int, toUserId: Int, status: Int) {
        self.fromUserId = fromUserId
        self.toUserId = toUserId
        self.status = CallingStatus(rawValue: status)
    }
    
    static func toEntity(statusResponse: StatusResponse) -> CallingStatusEntity {
        return CallingStatusEntity(
            fromUserId: Int(statusResponse.fromUserId),
            toUserId: Int(statusResponse.toUserId),
            status: Int(statusResponse.status.rawValue))
    }
}
