//
//  AllChatMessageEntity.swift
//  TalkingSns
//
//  Created by imagawa on 2020/02/03.
//  Copyright © 2020 imagawa. All rights reserved.
//

struct AllChatMessageEntity {
    
    let users: [UserEntity]
    let messages: [ChatMessageEntity]
    
    init(users: [UserEntity], messages: [ChatMessageEntity]) {
        self.users = users
        self.messages = messages
    }
    
    static func toEntity(response: AllChatMessageResponse) -> AllChatMessageEntity {
        
        var userEntities = [UserEntity]()
        for user in response.usersArray {
            guard let user = user as? User else {
                continue
            }
            userEntities.append(UserEntity.toEntity(user: user))
        }
        
        var messageEntities = [ChatMessageEntity]()
        for message in response.messagesArray {
            guard let message = message as? ChatMessage else {
                continue
            }
            messageEntities.append(ChatMessageEntity.toEntity(chatMessage: message))
        }
        
        return AllChatMessageEntity(users: userEntities, messages: messageEntities)
    }
}
