//
//  ReportApiClient.swift
//  TalkingSns
//
//  Created by imagawa on 2020/01/10.
//  Copyright © 2020 imagawa. All rights reserved.
//

import RemoteClient
import ReactiveSwift

class ReportApiClient {
    
    static let shared = ReportApiClient()
    
    private init() {}

    private var service: ReportService? {
        return GrpcServiceLoader.shared.getReportService()
    }
    
    func reportUser(toUserId: Int) -> SignalProducer<Bool, Error> {

        return SignalProducer<Bool, Error> {
            (observer, lifetime) in
                
            let request = PostReportRequest()
            request.toUserId = Int64(toUserId)
            
            self.service?.rpcToPostReport(with: request) {
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
