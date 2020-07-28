//
//  ChatApiClient.swift
//  TalkingSns
//
//  Created by imagawa on 2020/01/10.
//  Copyright © 2020 imagawa. All rights reserved.
//

import RemoteClient
import ReactiveSwift

class ChatApiClient: NSObject {
    
    // ドキュメント:
    // https://grpc.io/docs/tutorials/basic/objective-c/
    
    // コード(objc):
    // https://github.com/grpc/grpc/blob/v1.25.0/examples/objective-c/route_guide/ViewControllers.m
    
    // コード(swift):
    // https://github.com/grpc/grpc/blob/master/src/objective-c/examples/SwiftSample/ViewController.swift
    
    static let shared = ChatApiClient()
    
    override private init() {}
    
    private var receiveMessageProtoCall: GRPCProtoCall?
    
    private var service: ChatService? {
        return GrpcServiceLoader.shared.getChatService()
    }
    
    private let receiveMessagePipe
        = Signal<ReceivedMessageEntity, Never>.pipe()
    
    func getReceiveMessageSignal() -> Signal<ReceivedMessageEntity, Never> {
        return receiveMessagePipe.output
    }

    func sendMessage(toUserId: Int, message: String) -> SignalProducer<Bool, Error> {
                
        return SignalProducer<Bool, Error> {
            (observer, lifetime) in
        
            let request = SendMessageRequest()
            request.toUserId = Int64(toUserId)
            request.message = message
            
            self.service?.rpcToSendMessage(with: request) {
                (response: GPBEmpty?, error: Error?) in
                
                if let error = error {
                    observer.send(error: error)
                    return
                }
                
                guard response != nil else {
                    observer.send(error: NSError())
                    return
                }

                observer.send(value: true)
                observer.sendCompleted()
            }.startWithHeaders()
        }
    }
    
    func stopReceiveMessage() {
        receiveMessageProtoCall?.cancel()
    }
    
    func startReceiveMessage() {
        guard let service = service else {
            return
        }
        
        receiveMessageProtoCall = service.rpcToReceiveMessage(
            withRequest: GPBEmpty(),
            eventHandler: { [weak self] (result: Bool, response: ReceiveMessageResponse?, error: Error?) in
                
                if error != nil {
                    // API切断時の再接続処理(APIサーバーの停止時を想定)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        self?.startReceiveMessage()
                    }
                }

                guard let response = response else {
                    return
                }
                
                // receiveMessageObserverで受信したメッセージを通知する。
                self?.receiveMessagePipe.input.send(value:
                    ReceivedMessageEntity.toEntity(response: response))
            })
        receiveMessageProtoCall?.startWithHeaders()
    }
    
    func getAllMessages(minMessageId: Int) -> SignalProducer<AllChatMessageEntity, Error> {
        
        return SignalProducer<AllChatMessageEntity, Error> {
            (observer, lifetime) in
            
            let request = AllChatMessageRequest()
            request.minMessageId = Int64(minMessageId)
        
            self.service?.rpcToGetAllMessages(with: request) { (response: AllChatMessageResponse?, error: Error?) in
                
                if let error = error {
                    observer.send(error: error)
                    return
                }
                
                guard let response = response else {
                    observer.send(error: NSError())
                    return
                }
                
                observer.send(value: AllChatMessageEntity.toEntity(response: response))
                observer.sendCompleted()
            }.startWithHeaders()
        }
    }
}
