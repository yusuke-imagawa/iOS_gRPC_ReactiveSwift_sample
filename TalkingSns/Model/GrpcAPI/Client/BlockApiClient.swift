//
//  BlockApiClient.swift
//  TalkingSns
//
//  Created by imagawa on 2020/01/10.
//  Copyright © 2020 imagawa. All rights reserved.
//

import RemoteClient
import ReactiveSwift


class BlockApiClient {
    
    static let shared = BlockApiClient()
    
    private init() {}
    
    private var service: BlockService? {
        return GrpcServiceLoader.shared.getBlockService()
    }
    
    func block(toUserId: Int) -> SignalProducer<Bool, Error> {

        return SignalProducer<Bool, Error> {
            (observer, lifetime) in
            
            let request = BlockRequest()
            request.toUserId = Int64(toUserId)
            
            self.service?.rpcToBlock(with: request) { (response: GPBEmpty?, error: Error?) in
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
