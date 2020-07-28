//
//  ChatMessageEntity.swift
//  TalkingSns
//
//  Created by imagawa on 2020/02/03.
//  Copyright © 2020 imagawa. All rights reserved.
//

struct ChatMessageEntity {
    
    let id: Int
    let fromUserId: Int
    let toUserId: Int
    let message: String
    let date: Date
    
    init(
        id: Int,
        fromUserId: Int,
        toUserId: Int,
        message: String,
        date: Date) {
        
        self.id = id
        self.fromUserId = fromUserId
        self.toUserId = toUserId
        self.message = message
        self.date = date
    }
    
    static func toEntity(chatMessage: ChatMessage) -> ChatMessageEntity {
        
        return ChatMessageEntity(
            id: Int(chatMessage.id_p),
            fromUserId: Int(chatMessage.fromUserId),
            toUserId: Int(chatMessage.toUserId),
            message: chatMessage.message,
            date: chatMessage.date.date)
    }
}
