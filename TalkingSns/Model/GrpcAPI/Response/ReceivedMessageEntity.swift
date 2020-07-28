//
//  ReceivedMessageEntity.swift
//  TalkingSns
//
//  Created by imagawa on 2020/04/02.
//  Copyright © 2020 imagawa. All rights reserved.
//

struct ReceivedMessageEntity {

    let chatMessage: ChatMessageEntity
    let fromUser: UserEntity
    let toUser: UserEntity

    init(chatMessage: ChatMessageEntity, fromUser: UserEntity, toUser: UserEntity) {
        self.chatMessage = chatMessage
        self.fromUser = fromUser
        self.toUser = toUser
    }
    
    static func toEntity(response: ReceiveMessageResponse) -> ReceivedMessageEntity {
        return ReceivedMessageEntity(
            chatMessage: ChatMessageEntity.toEntity(chatMessage: response.chatMessage),
            fromUser: UserEntity.toEntity(user: response.fromUser),
            toUser: UserEntity.toEntity(user: response.toUser))
    }
}
