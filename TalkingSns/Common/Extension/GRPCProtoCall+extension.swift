//
//  GRPCProtoCall+extension.swift
//  TalkingSns
//
//  Created by imagawa on 2020/04/14.
//  Copyright © 2020 imagawa. All rights reserved.
//

extension GRPCProtoCall {

    func startWithHeaders() {
        if let userId = CurrentUserService.getCurrentUserId(),
            let apiToken = CurrentUserService.getApiToken() {
            requestHeaders.addEntries(from: ["user_id":String(userId)])
            requestHeaders.addEntries(from: ["api_token":apiToken])
        }
        start()
    }
}
