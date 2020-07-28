//
//  PushNotifyApiClient.swift
//  TalkingSns
//
//  Created by imagawa on 2020/01/10.
//  Copyright © 2020 imagawa. All rights reserved.
//

import RemoteClient
import ReactiveSwift

class PushNotifyApiClient: NSObject {
    
    static let shared = PushNotifyApiClient()
    
    override private init() {}

    private var service: PushNotifyService? {
        return GrpcServiceLoader.shared.getPushNotifyService()
    }
    
    func savePushTokenIos(deviceToken: String) -> SignalProducer<Bool, Error> {

        return SignalProducer<Bool, Error> {
            (observer, lifetime) in
                
            let request = SavePushTokenIosRequest()
            request.deviceToken = deviceToken
            
            self.service?.rpcToSavePushTokenIos(with: request) {
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
    
    func updateNotify(isEnabled: Bool) -> SignalProducer<Bool, Error> {

        return SignalProducer<Bool, Error> {
            (observer, lifetime) in

            let request = UpdateNotifyRequest()
            request.isEnabled = isEnabled

            self.service?.rpcToUpdateNotify(with: request) {
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
