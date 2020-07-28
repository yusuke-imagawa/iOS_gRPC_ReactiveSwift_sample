//
//  GrpcServiceLoader.swift
//  TalkingSns
//
//  Created by imagawa on 2020/02/02.
//  Copyright © 2020 imagawa. All rights reserved.
//

import UIKit

class GrpcServiceLoader {
    
    private var blockService: BlockService?
    private var callingService: CallingService?
    private var chatService: ChatService?
    private var pushNotifyService: PushNotifyService?
    private var reportService: ReportService?
    private var accountRegisterService: AccountRegisterService?
    private var accountService: AccountService?
    private var userService: UserService?
    
    static let shared = GrpcServiceLoader()
    
    // metadataの説明：
    // https://masuqat-blog.netlify.com/2018/10/06/grpc-python-metadata-and-interceptor/
    
    // GRPCリクエストにヘッダーをつける。
    // https://qiita.com/syou007/items/a9de47aa1a45260cdc3f
    
    private init() {
        // 非SSLでの接続には必要
        GRPCCall.useInsecureConnections(forHost: Constant.grpcApiHostStr())
    }
    
    private func getCallOptions() -> GRPCMutableCallOptions {
        let callOptions = GRPCMutableCallOptions()
        // keepalive機能で、再接続する。
        callOptions.keepaliveTimeout = 10
        callOptions.keepaliveInterval = 10
        
        callOptions.connectMinTimeout = 10
        callOptions.connectInitialBackoff = 3
        callOptions.connectMaxBackoff = 3600
        
//        open var connectMinTimeout: TimeInterval
//
//        open var connectInitialBackoff: TimeInterval
//
//        open var connectMaxBackoff: TimeInterval
        
        return callOptions
    }
        
    func getBlockService() -> BlockService? {
        if !CurrentUserService.isLogin() {
            return nil
        }
        
        if blockService == nil {
            blockService = BlockService(
                host: Constant.grpcApiHostStr(),
                callOptions: getCallOptions())
        }
        return blockService
    }
    
    func getCallingService() -> CallingService? {
        if !CurrentUserService.isLogin() {
            return nil
        }
        
        if callingService == nil {
            callingService = CallingService(
                host: Constant.grpcApiHostStr(),
                callOptions: getCallOptions())
        }
        return callingService
    }

    func getChatService() -> ChatService? {
        if !CurrentUserService.isLogin() {
            return nil
        }
        
        if chatService == nil {
            chatService = ChatService(
                host: Constant.grpcApiHostStr(),
                callOptions: getCallOptions())
        }
        return chatService
    }

    func getPushNotifyService() -> PushNotifyService? {
        if !CurrentUserService.isLogin() {
            return nil
        }
        
        if pushNotifyService == nil {
            pushNotifyService = PushNotifyService(
                host: Constant.grpcApiHostStr(),
                callOptions: getCallOptions())
        }
        return pushNotifyService
    }

    func getReportService() -> ReportService? {
        if !CurrentUserService.isLogin() {
            return nil
        }
        
        if reportService == nil {
            reportService = ReportService(
                host: Constant.grpcApiHostStr(),
                callOptions: getCallOptions())
        }
        return reportService
    }

    func getAccountRegisterService() -> AccountRegisterService {
        if accountRegisterService == nil {
            accountRegisterService = AccountRegisterService(
                host: Constant.grpcApiHostStr())
        }
        return accountRegisterService!
    }

    func getAccountService() -> AccountService? {
        if !CurrentUserService.isLogin() {
            return nil
        }
        
        if accountService == nil {
            accountService = AccountService(
                host: Constant.grpcApiHostStr(),
                callOptions: getCallOptions())
        }
        return accountService
    }
    
    func getUserService() -> UserService? {
        if !CurrentUserService.isLogin() {
            return nil
        }
        
        if userService == nil {
            userService = UserService(
                host: Constant.grpcApiHostStr(),
                callOptions: getCallOptions())
        }
        return userService
    }
}
