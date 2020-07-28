//
//  CallingApiClient.swift
//  TalkingSns
//
//  Created by imagawa on 2020/01/10.
//  Copyright © 2020 imagawa. All rights reserved.
//

import RemoteClient
import ReactiveSwift

class CallingApiClient: NSObject {
    
    static let shared = CallingApiClient()

    private override init() {}
    
    private var receiveCallingStatusProtoCall: GRPCProtoCall?
    
    private var service: CallingService? {
        return GrpcServiceLoader.shared.getCallingService()
    }
    
    let (receiveCallingStatusSignal, receiveCallingStatusObserver)
        = Signal<CallingStatusEntity, Never>.pipe()
    
    func startReceiveCallingStatus() {
        guard let service = service else {
            return
        }
        
        // 前回の接続が残っていたら、キャンセルして開始し直す。
        receiveCallingStatusProtoCall?.cancel()
        receiveCallingStatusProtoCall = service.rpcToReceiveCallingStatus(
            withRequest: GPBEmpty(),
            eventHandler:{ [weak self] (result: Bool, status: StatusResponse?, error: Error?) in
                
                guard let statusResponse = status else {
                    return
                }
                self?.receiveCallingStatusObserver.send(value:
                    CallingStatusEntity.toEntity(statusResponse: statusResponse))
            })
        receiveCallingStatusProtoCall?.startWithHeaders()
    }
    
    func startCalling(toUserId: Int) -> SignalProducer<StartCallingResultType, Error> {
        
        return SignalProducer<StartCallingResultType, Error> {
            (observer, lifetime) in

            let request = StartCallingRequest()
            request.toUserId = Int64(toUserId)

            self.service?.rpcToStartCalling(with: request) {
                (response: StartCallingResponse?, error: Error?) in
                
                if let error = error {
                    observer.send(error: error)
                    return
                }
                
                guard let response = response else {
                    observer.send(error: NSError())
                    return
                }
                
                var resultType: StartCallingResultType = .success
                if response.resultType == .toUserInTalking {
                    resultType = .to_user_in_talking
                }
                
                observer.send(value: resultType)
                observer.sendCompleted()
            }.startWithHeaders()
        }
    }
    
    func receiveCalling(fromUserId: Int, toUserId: Int) -> SignalProducer<Bool, Error> {
        
        return SignalProducer<Bool, Error> {
            (observer, lifetime) in

            let request = ReceiveCallingRequest()
            request.fromUserId = Int64(fromUserId)
            request.toUserId = Int64(toUserId)

            self.service?.rpcToReceiveCalling(with: request) {
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
    
    func endCalling(fromUserId: Int, toUserId: Int) -> SignalProducer<Bool, Error> {
        
        return SignalProducer<Bool, Error> {
            (observer, lifetime) in

            let request = EndCallingRequest()
            request.fromUserId = Int64(fromUserId)
            request.toUserId = Int64(toUserId)

            self.service?.rpcToEndCalling(with: request) {
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
    
    func continueCalling(fromUserId: Int, toUserId: Int) -> SignalProducer<Bool, Error> {
    
        return SignalProducer<Bool, Error> {
            (observer, lifetime) in

            let request = ContinueCallingRequest()
            request.fromUserId = Int64(fromUserId)
            request.toUserId = Int64(toUserId)

            self.service?.rpcToContinueCalling(with: request) {
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

enum StartCallingResultType {
    case success
    case to_user_in_talking
}
